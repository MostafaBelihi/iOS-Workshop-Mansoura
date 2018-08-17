//
//  UserCustomeTableCell.swift
//  TableViewDemo1
//
//  Created by Mahmoud Ibaraheim on 8/8/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class UserCustomeTableCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var userAddressLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
