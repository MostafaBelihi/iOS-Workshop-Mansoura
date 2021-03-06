//
//  ItemCustomeCell.swift
//  FirstNetWorkSession
//
//  Created by Khaled on 9/2/18.
//  Copyright © 2018 Codex. All rights reserved.
//

import UIKit
import Kingfisher

class ItemCustomeCell: UITableViewCell {

    @IBOutlet weak var itemTitleLbl: UILabel!
    
    @IBOutlet weak var itemDetailsLbl: UILabel!
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configurerWithItem(item: ServiceItem) {
        itemTitleLbl.text = item.name ?? ""
        itemDetailsLbl.text = item.brief ?? ""
        
        let url = URL(string: item.photo ?? "")
        itemImageView.kf.setImage(with: url)
    }
}
