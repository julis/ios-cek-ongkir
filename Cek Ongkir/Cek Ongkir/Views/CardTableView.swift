//
//  CardTableView.swift
//  Cek Ongkir
//
//  Created by julis on 2/26/17.
//  Copyright © 2017 julis. All rights reserved.
//

import UIKit
import Material

class CardTableView: UITableView {
    internal lazy var heights = [IndexPath: CGFloat]()
    
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    public init() {
        super.init(frame: .zero, style: .plain)
        prepare()
    }
    
    /// Prepares the tableView.
    private func prepare() {
        delegate = self
        dataSource = self
        separatorStyle = .none
        backgroundColor = nil
        
        register(CardTableViewCell.self, forCellReuseIdentifier: "CardTableViewCell")
    }
}

extension CardTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Prepares the cells within the tableView.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as! CardTableViewCell
        cell.data = "Test"
        cell.isLast = indexPath.row == 3 - 1
        heights[indexPath] = cell.height
        return cell
    }
}

extension CardTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heights[indexPath] ?? height
    }
}
