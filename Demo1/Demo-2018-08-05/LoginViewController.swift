//
//  LoginViewController.swift
//  Demo3
//
//  Created by Mahmoud Ibaraheim on 8/5/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	//SS: Overriden from UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	///SS: View controls as members in the view controller
	//SS: IBOutlet lets you access data from and to UI controls
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
	
	//SS: IBAction lets you handle an event of a control
    @IBAction func loginAction(_ sender: UIButton) {
        
        let userName = usernameTextField.text
        let userPass = userPasswordTextField.text
        
        if userName == "Ali" && userPass == "123456"{
			//SS: Navigation using segue, uses the identifier assigned to the segue in design when the segue was created
			performSegue(withIdentifier: "showSignupseg", sender: nil)	//SS: member of UIViewController
			
			//SS: Navigation using NavigationController (Commented)
			//SS: **Redundant of previous navigation by performSegue, use one of them**
			let st = UIStoryboard(name: "Main", bundle: nil)	//SS: gets storyboard
            let vc = st.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
					//SS: gets view controller from storyboard
            vc.userName = "Ali"		//SS: sends this value to this property of the view controller
            self.navigationController?.pushViewController(vc, animated: true)
					//SS: pushes the view controller to NavigationController, so it's viewed
        }
        else {
			//SS: Navigation using segue
            performSegue(withIdentifier: "showForgetPassSeg", sender: nil)

			//SS: Navigation using NavigationController (Commented)
			//SS: **Redundant of previous navigation by performSegue, use one of them**
            let st = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(withIdentifier: "ForgetPassViewController")
            self.navigationController?.pushViewController(vc, animated: true)
            showInvalidLoginAlert()
        }
    }
	
	//SS: Fires immediately before performing segue (with the performSegue function)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showSignupseg" {	//SS: checks the identifier assigned to the segue
			let vc = segue.destination as! SignupViewController		//SS: catched the view controller
			vc.userName = "😎😎😎😎😎"		//SS: sending data to the new view controller when using performSegue
        }
        else if segue.identifier == "" {
            
        }
    }
	
	///SS: This method defines, builds, and shows UIAlert
    private func showInvalidLoginAlert() {
		//SS: Controller
        let controller = UIAlertController(title: "Auth error 😛", message: "Invalid user name or password", preferredStyle: .alert)
		
		//SS: Action buttons
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default, handler: nil)
		
		//SS: Here, hendler is added as a code block after function call, this is the third argument
																		/* unowned or weak is used here
																		   to prevent retain cycle */
        let signupAction = UIAlertAction(title: "Sign up", style: .destructive) { [unowned self] (action) in
			//SS: Navigating using NavigatonController via code
            let st = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(withIdentifier: "SignupViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
		
		//SS: Adding actions to the controller
        controller.addAction(cancelAction)
        controller.addAction(signupAction)
		
		//SS: A UIViewController member
        present(controller, animated: true, completion: nil)
        
    }
}
