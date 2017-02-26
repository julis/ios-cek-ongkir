//
//  LocationSearchBarControllerViewController.swift
//  Cek Ongkir
//
//  Created by julis on 2/26/17.
//  Copyright © 2017 julis. All rights reserved.
//

import UIKit
import Material

class LocationSearchBarController: SearchBarController {

    private var backButton: IconButton!
    
    open override func prepare() {
        super.prepare()
        prepareBackButton()
        prepareStatusBar()
        prepareSearchBar()
    }
    
    private func prepareBackButton() {
        backButton = IconButton(image: Icon.cm.arrowBack)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: UIControlEvents.touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @objc
    private func backButtonTapped(_ sender:AnyObject) {
        rootViewController.dismiss(animated: true, completion: nil)
    }
    
    
    private func prepareStatusBar() {
        statusBarStyle = .lightContent
        
    }
    
    private func prepareSearchBar() {
        searchBar.leftViews = [backButton]
        searchBar.rightViews = []
    }

}
