//
//  HeaderCustomeCell.swift
//  TableViewDemo1
//
//  Created by Mohamed Abolela on 8/15/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class HeaderCustomeCell: UITableViewCell {

    @IBOutlet weak var catNameLbl: UILabel!
    @IBOutlet weak var showMoreBtn: UIButton!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
