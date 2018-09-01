//
//  UserDetailsViewController.swift
//  TableViewDemo1
//
//  Created by Mohamed Abolela on 8/26/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userAddress: UILabel!

    var user:User? {
        didSet {
            userImageView.image = user?.userImage
            userNameLbl.text = user?.userName
            userAddress.text = user?.userAddress
        }
    }

    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        userImageView.image = user?.userImage
//        userNameLbl.text = user?.userName
//        userAddress.text = user?.userAddress
    }
}
