//
//  UserCustomeTableCell.swift
//  TableViewDemo1
//
//  Created by Mahmoud Ibaraheim on 8/8/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

//SS:: Class that handles behavior of the Prototype Cell (inherits UITableViewCell)
class UserCustomeTableCell: UITableViewCell {

	//SS: Elements in the cell
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var userAddressLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
