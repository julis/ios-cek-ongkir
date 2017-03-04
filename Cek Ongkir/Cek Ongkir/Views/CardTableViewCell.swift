//
//  CardTableViewCell.swift
//  Cek Ongkir
//
//  Created by julis on 2/26/17.
//  Copyright © 2017 julis. All rights reserved.
//

import UIKit
import Material

class CardTableViewCell: TableViewCell {
    private var spacing: CGFloat = 10
    
    /// A boolean that indicates whether the cell is the last cell.
    public var isLast = false
    
    public var data: String? {
        didSet {
            layoutSubviews()
        }
    }
    
    public lazy var card: Card = Card()
    
    /// Toolbar views.
    private var toolbar: Toolbar!
    
    /// Content area.
    private var originLabel: UILabel!
    private var destLabel: UILabel!
    
    private var serviceLabel: UILabel!
    private var descLabel: UILabel!
    private var costLabel: UILabel!
    private var etdLabel: UILabel!
    private var noteLabel: UILabel!
    
    
    
    
    
    /// Calculating dynamic height.
    open override var height: CGFloat {
        get {
            return card.height + spacing
        }
        set(value) {
            super.height = value
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        toolbar.title = "POS"
        toolbar.detail = "POS Indonesia (POS)"
        
        originLabel.text = "Origin: Yogyakarta (Kota), DI Yogyakarta"
        destLabel.text = "Destination: Denpasar (Kota), Bali"
        
        serviceLabel.text = "Service: Surat Kilat Khusus"
        descLabel.text = "Description: Surat Kilat Khusus"
        costLabel.text = "Cost: 46000"
        etdLabel.text = "Etd: 2-4"
        noteLabel.text = "Note: "
        
        
        
        
        card.x = 0
        card.y = 0
        card.width = width
        
        card.setNeedsLayout()
        card.layoutIfNeeded()
    }
    
    open override func prepare() {
        super.prepare()
        
        layer.rasterizationScale = Screen.scale
        layer.shouldRasterize = true
        
        pulseAnimation = .none
        backgroundColor = nil
        
        prepareToolbar()
        prepareContentArea()
        
        preparePresenterCard()
    }
    
    
    
    
    private func prepareToolbar() {
        toolbar = Toolbar()
        toolbar.heightPreset = .xlarge
        toolbar.contentEdgeInsetsPreset = .square3
        toolbar.titleLabel.textAlignment = .left
        toolbar.detailLabel.textAlignment = .left
        toolbar.dividerColor = Color.grey.lighten3
        toolbar.dividerAlignment = .top
    }
    
    
    private func prepareContentArea() {
        originLabel = UILabel()
        originLabel.numberOfLines = 0
        originLabel.font = RobotoFont.regular(with: 14)
        
        destLabel = UILabel()
        destLabel.numberOfLines = 0
        destLabel.font = RobotoFont.regular(with: 14)
        
        serviceLabel = UILabel()
        serviceLabel.numberOfLines = 0
        serviceLabel.font = RobotoFont.regular(with: 14)
        
        descLabel = UILabel()
        descLabel.numberOfLines = 0
        descLabel.font = RobotoFont.regular(with: 14)

        costLabel = UILabel()
        costLabel.numberOfLines = 0
        costLabel.font = RobotoFont.regular(with: 14)

        etdLabel = UILabel()
        etdLabel.numberOfLines = 0
        etdLabel.font = RobotoFont.regular(with: 14)

        noteLabel = UILabel()
        noteLabel.numberOfLines = 0
        noteLabel.font = RobotoFont.regular(with: 14)

    }
    
    
    
    private func preparePresenterCard() {
        card.toolbar = toolbar
        
        prepareContentView()
        
        //card.contentView = UIView()
        
        //card.contentView?.layout.vertically([originLabel, destLabel, serviceLabel, descLabel, costLabel, etdLabel, noteLabel], top: 20, bottom: 20, interimSpace: 15)
        
        card.contentViewEdgeInsetsPreset = .square3
        card.contentViewEdgeInsets.bottom = 0
        card.depthPreset = .none
        
        contentView.addSubview(card)
    }
    
    func prepareContentView()
    {
        let view = UIView()
        view.height = 200
        view.addSubview(originLabel)
        view.addSubview(destLabel)
        view.addSubview(serviceLabel)
        view.addSubview(descLabel)
        view.addSubview(costLabel)
        view.addSubview(etdLabel)
        view.addSubview(noteLabel)
        
        view.layout.vertically([originLabel, destLabel, serviceLabel, descLabel, costLabel, etdLabel, noteLabel])
        
        card.contentView = view
        
    }
}
