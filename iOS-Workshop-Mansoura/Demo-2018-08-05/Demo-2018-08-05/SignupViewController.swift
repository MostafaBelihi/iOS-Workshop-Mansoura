//
//  SignupViewController.swift
//  Demo3
//
//  Created by Mahmoud Ibaraheim on 8/5/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var usermailTextField: UITextField!
    
    @IBOutlet weak var userPhoneTextField: UITextField!
    
    @IBOutlet weak var userCityTextField: UITextField!
    
    @IBOutlet weak var userPassTextField: UITextField!
    
    var userName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Welcome \(userName ?? "" )"
    }

    @IBAction func signupAction(_ sender: Any) {
    }
}
