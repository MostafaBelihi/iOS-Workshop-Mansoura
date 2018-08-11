//
//  LoginViewController.swift
//  Demo3
//
//  Created by Mahmoud Ibaraheim on 8/5/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        let userName = usernameTextField.text
        let userPass = userPasswordTextField.text
        
        if userName == "Ali" && userPass == "123456"{
            performSegue(withIdentifier: "showSignupseg", sender: nil)
//            let st = UIStoryboard(name: "Main", bundle: nil)
//            let vc = st.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
//            vc.userName = "Ali"
//            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            performSegue(withIdentifier: "showForgetPassSeg", sender: nil)

//            let st = UIStoryboard(name: "Main", bundle: nil)
//            let vc = st.instantiateViewController(withIdentifier: "ForgetPassViewController")
//            self.navigationController?.pushViewController(vc, animated: true)

//            showInvalidLoginAlert()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSignupseg" {
            let vc = segue.destination as! SignupViewController
            vc.userName = "😎😎😎😎😎"
        }
        else if segue.identifier == "" {
            
        }
    }
    
    private func showInvalidLoginAlert() {
        let controller = UIAlertController(title: "Auth error 😛", message: "Invalid user name or password", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default, handler: nil)
        
        let signupAction = UIAlertAction(title: "Sign up", style: .destructive) { [unowned self] (action) in
            
            let st = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(withIdentifier: "SignupViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        controller.addAction(cancelAction)
        controller.addAction(signupAction)
        
        present(controller, animated: true, completion: nil)
        
    }
}
