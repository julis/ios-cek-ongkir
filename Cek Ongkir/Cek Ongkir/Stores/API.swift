//
//  API.swift
//  Cek Ongkir
//
//  Created by julis on 2/26/17.
//  Copyright © 2017 julis. All rights reserved.
//

import UIKit
import CoreData



class API: NSObject {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    typealias APICallback = ((JSON?, Error?) -> ())
    let responseData = NSMutableData()
    var statusCode:Int = -1
    var callback: APICallback! = nil
    
    func prepareData(callback: @escaping APICallback){
        getCities(callback: callback)
    }
    
    func prepareDataCities(callback: @escaping ((Error?)->())){
        self.getCities { (json, error) in
            if let error = error {
                callback(error)
            }
            guard let json = json else {
                callback("json error")
                return
            }
            
            if let statusCode = json["rajaongkir"]["status"]["code"].int, statusCode == 200 {
                let cities = json["rajaongkir"]["results"].arrayValue
                
                let context = self.appDelegate.managedObjectContext
                
                for city in cities {
                    let myCity = City.create(from: city)
                    print(myCity)
                    print("=================================")
                    
                }
                
                
                callback(nil)
            }else{
                callback(json["rajaongkir"]["status"]["description"].stringValue)
            }
            
        }
    }
    
    
    func getProvinces(callback: @escaping APICallback) {
        makeHttpGetRequest(with: OngkirAPI.cityURL, callback: callback)
    }
    
    func getCities(callback: @escaping APICallback) {
        makeHttpGetRequest(with: OngkirAPI.cityURL, callback: callback)
    }
    
    func makeHttpGetRequest(with url:String, callback: @escaping APICallback){
        let headers = [Key.apiKeyName: Key.apiKeyValue, Key.apiIOSKeyName: Key.apiIOSKeyValue]
        
        var request = URLRequest(url: URL(string: url)!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                callback(nil, error)
            } else {
                let json:JSON = JSON(data: data!)
                callback(json, nil)
            }
        })
        task.resume()
    }
    
}
