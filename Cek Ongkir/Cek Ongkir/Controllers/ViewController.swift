//
//  ViewController.swift
//  Cek Ongkir
//
//  Created by julis on 2/23/17.
//  Copyright © 2017 julis. All rights reserved.
//

import UIKit
import Material


class ViewController: UIViewController {

    private var bar: Bar!
    
    private var homeButton: IconButton!
    private var originLabel: UILabel!
    private var settingButton: IconButton!
    
    private var searchCard: Card!
    private var toolbarCard: Toolbar!
    private var searchIcon: IconButton!
    
    private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        prepareHomeButton()
        prepareOriginLabel()
        prepareSettingButton()
        prepareBar()
        
        prepareSearchIcon()
        prepareToolbarCard()
        prepareCard()
        
        prepareImageView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func prepareHomeButton() {
        homeButton = IconButton(image: Icon.home, tintColor: .darkGray)
        
    }
    
    private func prepareOriginLabel() {
        originLabel = UILabel()
        originLabel.text = "Bandung"
        originLabel.textColor = UIColor.darkGray
    }
    
    private func prepareSettingButton() {
        settingButton = IconButton(image: Icon.settings, tintColor: .darkGray)
    }
    
    private func prepareBar() {
        bar = Bar(leftViews: [homeButton,originLabel], rightViews: [settingButton])
        
        view.layout(bar).horizontally().top(20)
    }
    
    private func prepareSearchIcon() {
        searchIcon = IconButton(image: Icon.place, tintColor: .red)
        searchIcon.addTarget(self, action: #selector(openSearchView(_:)), for: UIControlEvents.touchUpInside)
    }
    
    private func prepareToolbarCard() {
        toolbarCard = Toolbar(rightViews: [searchIcon])
        
        
    }
    
    private func prepareCard() {
        searchCard = Card()
        searchCard.toolbar = toolbarCard
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openSearchView(_:)))
        searchCard.addGestureRecognizer(tapGesture)
        
        view.layout(searchCard).horizontally(left: 20, right: 20).center()
    }
    
    private func prepareImageView() {
        imageView = UIImageView()
        imageView.image = UIImage(named: "cekongkir.png")?.resize(toWidth: view.width)
        imageView.height = 70
        imageView.width = view.width - 40
        imageView.contentMode = .scaleAspectFit
        
        //view.layout(imageView).horizontally(left: 40, right: 40).top(20+bar.height+40)
        view.layout(imageView).horizontally(left: 40, right: 40).bottom(searchCard.center.y+searchCard.width)
        
    }
    
    func openSearchView(_ sender: AnyObject){
        let locationSearchVC = LocationSearchBarController(rootViewController: SearchViewController())
        self.present(locationSearchVC, animated: true, completion: nil)
    }
}

