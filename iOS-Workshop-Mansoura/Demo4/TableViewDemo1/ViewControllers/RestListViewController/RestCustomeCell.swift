//
//  RestCustomeCell.swift
//  TableViewDemo1
//
//  Created by Mohamed Abolela on 8/15/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class RestCustomeCell: UITableViewCell {

	//SS: Elements in the cell
    @IBOutlet weak var restImageView: UIImageView!
    
    @IBOutlet weak var restNameLbl: UILabel!
    
    @IBOutlet weak var restLatLbl: UILabel!
    
    @IBOutlet weak var restLngLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
