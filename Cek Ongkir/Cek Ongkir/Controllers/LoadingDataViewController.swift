//
//  LoadingDataViewController.swift
//  Cek Ongkir
//
//  Created by julis on 3/3/17.
//  Copyright © 2017 julis. All rights reserved.
//

import UIKit

class LoadingDataViewController: UIViewController {
    
    let preloadedDataItemKey = "PreloadedData"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("-------------> The Value for Key \(preloadedDataItemKey) actually exists. It is: \(PlistManager.sharedInstance.getValueForKey(key: preloadedDataItemKey))")
        
        PlistManager.sharedInstance.saveValue(value: true as AnyObject, forKey: preloadedDataItemKey)
        
        print("-------------> The Value for Key \(preloadedDataItemKey) now it is: \(PlistManager.sharedInstance.getValueForKey(key: preloadedDataItemKey))")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //prepareData()
        //prepareCompletingData(sender: self)
    }
    
    func prepareData(){
        Loading.start()
        let Api = API()
        
        Api.prepareData { (data, error) in
            if error == nil {
                print(data!)
                DispatchQueue.main.async(execute: {
                    Loading.stop()
                })
                
            }
        }
    }
    
    func prepareCompletingData(sender: AnyObject){
        Loading.start()
        let api = API()
        api.prepareDataCities { (error) in
            if let error = error {
                print(error)
            }
            
            DispatchQueue.main.async(execute: {
                Loading.stop()
            })
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
