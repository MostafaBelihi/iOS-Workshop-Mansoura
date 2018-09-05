//
//  ItemCustomeCell.swift
//  FirstNetWorkSession
//
//  Created by Khaled on 9/2/18.
//  Copyright © 2018 Codex. All rights reserved.
//

///SSS:: File Commented

import UIKit
import Kingfisher

class ItemCustomeCell: UITableViewCell {
	
	@IBOutlet weak var itemTitleLbl: UILabel!
	
	@IBOutlet weak var itemDetailsLbl: UILabel!
	
	@IBOutlet weak var itemImageView: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
	func configurerWithItem(item:Item) {
		//SS: Binds item to view elements
		itemTitleLbl.text = item.name
		itemDetailsLbl.text = item.details
		
		//SS: Binds image by URL using KingFisher
		let url = URL(string: item.imageUrl)
		itemImageView.kf.setImage(with: url)
	}
}
