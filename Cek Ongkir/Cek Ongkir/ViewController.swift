//
//  ViewController.swift
//  Cek Ongkir
//
//  Created by julis on 2/23/17.
//  Copyright © 2017 julis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textViewResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTappedButtonGetProvince(_ sender: UIButton) {
        let headers = [Key.apiKeyName: Key.apiKeyValue, Key.apiIOSKeyName: Key.apiIOSKeyValue]
        
        
        var myRequest = URLRequest(url: URL(string: OngkirAPI.provinceURL)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        myRequest.httpMethod = "GET"
        myRequest.allHTTPHeaderFields = headers
        
        let mySession = URLSession.shared
        let task = mySession.dataTask(with: myRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error ?? "")
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
                
                
                
                
                if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    print(json!)
                        DispatchQueue.main.async{
                            self.textViewResult.text = "\(httpResponse) \n \(json)"

                        }
                    
                }
                
                

                
            }
        })
        
        task.resume()
        
        
    }
    
    
    @IBAction func didTappedButtonGetCity(_ sender: AnyObject) {
        
        let headers = [Key.apiKeyName: Key.apiKeyValue, Key.apiIOSKeyName: Key.apiIOSKeyValue]
        
        var request = URLRequest(url: URL(string: OngkirAPI.cityURL)!,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error ?? "")
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse ?? "")
                
                
                
                
                if let data = data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    print(json ?? "")
                        DispatchQueue.main.async{
                            self.textViewResult.text = "\(httpResponse) \n \(json)"
                            
                        }
                    
                }
                
                
                
                
            }
        })
        task.resume()
        
    }


}

