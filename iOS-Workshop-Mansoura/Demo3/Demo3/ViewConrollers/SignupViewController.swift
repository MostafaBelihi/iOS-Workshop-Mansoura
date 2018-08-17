//
//  SignupViewController.swift
//  Demo3
//
//  Created by Mahmoud Ibaraheim on 8/5/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

//SS: Implements PickerView behaviors in the view controller
class SignupViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
	
	//SS: UI elements
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var usermailTextField: UITextField!
	@IBOutlet weak var userPhoneTextField: UITextField!
	@IBOutlet weak var userCityTextField: UITextField!
	@IBOutlet weak var userPassTextField: UITextField!
	@IBOutlet weak var dateOfBirthTextField: UITextField!
	
	var userName:String!
	
	//SS: List of cities as a data source
	//SS: lazy loads an object in memory only when used
	lazy var citiesDataSource = [City(cityId:"10",cityName:"City 10"),
								 City(cityId:"20",cityName:"City 20"),
								 City(cityId:"30",cityName:"City 30"),
								 City(cityId:"40",cityName:"City 40"),
								 City(cityId:"50",cityName:"City 50")]
	
	lazy var citiesPickerView = UIPickerView()
	lazy var dateOfBirthDatePickerView = UIDatePicker()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//SS: Sets current view controller as implementer of PickerView protocols
		citiesPickerView.dataSource = self
		citiesPickerView.delegate = self
		
		//SS:: inputView of a field controls the input method for it if not keyboard.
		userCityTextField.inputView = citiesPickerView
		dateOfBirthTextField.inputView = dateOfBirthDatePickerView
		
		//SS: Assigning event handler (review Quick Help of addTarget function)
		//1. DatePickerView does not have delegates (events) and no data source
		//2. addTarget is used to add a custom event for it
		dateOfBirthDatePickerView.addTarget(self, action: #selector(didSelectDate), for: .valueChanged)
	}
	
	//SS: Event handler, assigns PickerView value to text field
	@objc func didSelectDate() {
		dateOfBirthTextField.text = "\(dateOfBirthDatePickerView.date)"
	}
	
	@IBAction func signupAction(_ sender: Any) {
		
	}
	
	//SS: Hidden button used to hide keyboard when clicked (a simple workaround)
	@IBAction func hideKeyBoardAction(_ sender: Any) {
		view.endEditing(true)
	}
	
	/* Constructing the cities Picker View */
	//SS: Defines number of components
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	//SS: Number of rows
	func pickerView(_ pickerView: UIPickerView,
					numberOfRowsInComponent component: Int) -> Int {
		return citiesDataSource.count
	}
	
	//SS: Returns data from data source to display in Picker View (binding)
	func pickerView(_ pickerView: UIPickerView,
					titleForRow row: Int, forComponent component: Int) -> String? {
		
		let currentCity = citiesDataSource[row]
		return currentCity.cityName
	}
	
	//SS: Hanldes action when an item is selected in Picker View
	func pickerView(_ pickerView: UIPickerView,
					didSelectRow row: Int, inComponent component: Int) {
		let currentCity = citiesDataSource[row]
		userCityTextField.text = currentCity.cityName
	}
	
}
