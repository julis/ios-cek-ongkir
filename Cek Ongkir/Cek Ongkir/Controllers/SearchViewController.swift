//
//  SearchViewController.swift
//  Cek Ongkir
//
//  Created by julis on 2/26/17.
//  Copyright © 2017 julis. All rights reserved.
//

import UIKit
import Material

class SearchViewController: UIViewController, SearchBarDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        prepareSearchBar()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        focusingSearchBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func prepareSearchBar() {
        guard let searchBar = searchBarController?.searchBar else {
            return
        }
        searchBar.delegate = self
        
    }
    
    func focusingSearchBar() {
        
        guard let searchBar = searchBarController?.searchBar else {
            return
        }
        
        DispatchQueue.main.async {
            searchBar.textField.becomeFirstResponder()
        }
        
    }
}
