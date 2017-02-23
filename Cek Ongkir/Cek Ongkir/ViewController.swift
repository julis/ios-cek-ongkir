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
    
    @IBAction func didTappedButtonGetProvince(sender: UIButton) {
        let headers = [Key.apiKeyName: Key.apiKeyValue, Key.apiIOSKeyName: Key.apiIOSKeyValue]
        
        let request = NSMutableURLRequest(URL: NSURL(string: OngkirAPI.provinceURL)!,
                                          cachePolicy: .UseProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.HTTPMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? NSHTTPURLResponse
                print(httpResponse)
                
                
                
                
                if let data = data,
                let json = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary {
                    print(json)
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
                        dispatch_async(dispatch_get_main_queue()){
                            self.textViewResult.text = "\(httpResponse) \n \(json)"

                        }
                    }
                }
                
                

                
            }
        })
        
        dataTask.resume()
        
        
        
        
        
    }
    
    
    @IBAction func didTappedButtonGetCity(sender: AnyObject) {
        
        let headers = [Key.apiKeyName: Key.apiKeyValue, Key.apiIOSKeyName: Key.apiIOSKeyValue]
        
        let request = NSMutableURLRequest(URL: NSURL(string: OngkirAPI.cityURL)!,
                                          cachePolicy: .UseProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.HTTPMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? NSHTTPURLResponse
                print(httpResponse)
                
                
                
                
                if let data = data,
                    let json = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary {
                    print(json)
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
                        dispatch_async(dispatch_get_main_queue()){
                            self.textViewResult.text = "\(httpResponse) \n \(json)"
                            
                        }
                    }
                }
                
                
                
                
            }
        })
        
        dataTask.resume()
    }


}

