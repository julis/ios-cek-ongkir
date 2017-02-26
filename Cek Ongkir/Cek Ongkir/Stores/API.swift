//
//  API.swift
//  Cek Ongkir
//
//  Created by julis on 2/26/17.
//  Copyright © 2017 julis. All rights reserved.
//

import Foundation

typealias JSONDictionary = Dictionary<String, AnyObject>
typealias JSONArray = Array<AnyObject>

class API: NSObject {
    
    
    typealias APICallback = ((AnyObject?, Error?) -> ())
    let responseData = NSMutableData()
    var statusCode:Int = -1
    var callback: APICallback! = nil
    
    
    func getProvinces(callback: @escaping APICallback) {
        let headers = [Key.apiKeyName: Key.apiKeyValue, Key.apiIOSKeyName: Key.apiIOSKeyValue]
        
        
        var myRequest = URLRequest(url: URL(string: OngkirAPI.provinceURL)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        myRequest.httpMethod = "GET"
        myRequest.allHTTPHeaderFields = headers
        
        let mySession = URLSession.shared
        let task = mySession.dataTask(with: myRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                callback(nil, error)
            } else {
                if let data = data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    callback(json,nil)
                }
            }
        })
        
        task.resume()
    }
    
    func getCities(callback: @escaping APICallback) {
        let headers = [Key.apiKeyName: Key.apiKeyValue, Key.apiIOSKeyName: Key.apiIOSKeyValue]
        
        var request = URLRequest(url: URL(string: OngkirAPI.cityURL)!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                callback(nil, error)
            } else {
                if let data = data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    callback(json,nil)
                }
            }
        })
        task.resume()
    }
    
}
