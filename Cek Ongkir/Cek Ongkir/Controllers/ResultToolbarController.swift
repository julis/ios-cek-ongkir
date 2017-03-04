//
//  ResultToolbarController.swift
//  Cek Ongkir
//
//  Created by julis on 2/26/17.
//  Copyright © 2017 julis. All rights reserved.
//

import UIKit
import Material

class ResultToolbarController: ToolbarController {
    var card: Card!
    
    var locationIcon: IconButton!
    var searchIcon: IconButton!
    
    var originLabel: UILabel!
    var destLabel: UILabel!
    
    open override func prepare() {
        super.prepare()
        prepareDestLabel()
        prepareOriginLabel()
        prepareLocationIcon()
        prepareCard()
    }
}

extension ResultToolbarController {
    func prepareDestLabel() {
        destLabel = UILabel()
        destLabel.text = "Jakarta"
        destLabel.textColor = UIColor.darkGray
        
    }
    
    func prepareOriginLabel() {
        originLabel = UILabel()
        originLabel.text = "Bandung"
        destLabel.textColor = UIColor.darkGray
    }
    
    func prepareLocationIcon() {
        locationIcon = IconButton(image: Icon.place, tintColor: .red)
        locationIcon.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
        
        searchIcon = IconButton(image: Icon.search, tintColor: .lightGray)
        searchIcon.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
    }
    
    func prepareCard() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiss(_:)))
    
        
        toolbar.depthPreset = .depth2
        
        toolbar.title = "Semarang"
        toolbar.titleLabel.textAlignment = .left
        
        toolbar.detail = "Jawa Tengah"
        toolbar.detailLabel.textAlignment = .left
        
        toolbar.leftViews = [locationIcon]
        toolbar.rightViews = [searchIcon]
        
        
        toolbar.contentView.isHidden = false
        
        toolbar.addGestureRecognizer(tapRecognizer)
    }
    
    func dismiss(_ sender:AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}


