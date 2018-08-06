//
//  TestViewController.swift
//  iOSWorkshopStarter
//
//  Created by Mostafa AlBelliehy on 29/07/2018.
//  Copyright © 2018 Mostafa AlBelliehy. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITextFieldDelegate {

    
    // Class members referencing UI elements
    // Adding pressing ctrl+drag
    
    // MST:: References to text fields
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var citiesPicker: UIPickerView!
    
    
    // MST:: A button action
    @IBAction func testAction(_ sender: Any) {
        print("Test button clicked");
        view.endEditing(true);      // MST:: hide keyboard while editing
        
    }
    
    // MST:: ViewController lifecycle member (overrides a member in UIViewController parent)
    override func viewDidLoad() {
        super.viewDidLoad()

        // MST:: Assign current ViewController as implementation for UITextFieldDelegate for every text field
        name.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
