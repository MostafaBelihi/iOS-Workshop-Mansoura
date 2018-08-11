//
//  SignupViewController.swift
//  Demo3
//
//  Created by Mahmoud Ibaraheim on 8/5/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usermailTextField: UITextField!
    @IBOutlet weak var userPhoneTextField: UITextField!
    @IBOutlet weak var userCityTextField: UITextField!
    @IBOutlet weak var userPassTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    var userName:String!
    
    lazy var citiesDataSource = [City(cityId:"10",cityName:"City 10"),
                                 City(cityId:"20",cityName:"City 20"),
                                 City(cityId:"30",cityName:"City 30"),
                                 City(cityId:"40",cityName:"City 40"),
                                 City(cityId:"50",cityName:"City 50")]
    
    lazy var citiesPickerView = UIPickerView()
    lazy var dateOfBirthDatePickerView = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesPickerView.dataSource = self
        citiesPickerView.delegate = self
        userCityTextField.inputView = citiesPickerView
        
        dateOfBirthTextField.inputView = dateOfBirthDatePickerView
        dateOfBirthDatePickerView.addTarget(self, action: #selector(didSelectDate), for: .valueChanged)
    }

    @objc func didSelectDate() {
        dateOfBirthTextField.text = "\(dateOfBirthDatePickerView.date)"
    }
    
    @IBAction func signupAction(_ sender: Any) {
        
    }
    
    
    @IBAction func hideKeyBoardAction(_ sender: Any) {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return citiesDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int, forComponent component: Int) -> String? {
        
        let currentCity = citiesDataSource[row]
        return currentCity.cityName
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int, inComponent component: Int) {
        let currentCity = citiesDataSource[row]
        userCityTextField.text = currentCity.cityName
    }
    
}
