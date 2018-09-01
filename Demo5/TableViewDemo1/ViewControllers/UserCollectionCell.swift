//
//  UserCollectionCell.swift
//  TableViewDemo1
//
//  Created by Mohamed Abolela on 8/26/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class UserCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    
    var user:User? {
        didSet {
            userImageView.image = user?.userImage
            userNameLbl.text = user?.userName
        }
    }
    
    
//    func setupWithUser(user:User) {
//        userImageView.image = user.userImage
//        userNameLbl.text = user.userName
//    }
}
