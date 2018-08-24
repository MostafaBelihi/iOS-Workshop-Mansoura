//
//  UserListViewController.swift
//  TableViewDemo1
//
//  Created by Mahmoud Ibaraheim on 8/8/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

//SS: View contoller that contains the TableView
class UserListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
	
	//SS: UI elements
	@IBOutlet weak var usersTableView: UITableView!
	
	//SS: Data source
	lazy var usersDataSource:[User] = [User(userImage: UIImage(named: "account_green")!, userName: "Name 0", userAddress: "Address 0"),
									   User(userImage: UIImage(named: "account_green")!, userName: "Name 1", userAddress: "Address 1"),
									   User(userImage: UIImage(named: "account_green")!, userName: "Name 2", userAddress: "Address 2"),
									   User(userImage: UIImage(named: "account_green")!, userName: "Name 3", userAddress: "Address 3")]
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//SS: Adopting protocol
		usersTableView.dataSource = self
		usersTableView.delegate = self
	}
	
	/*SS: Constructing the TableView */
	//SS: Sections
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	//SS: Count
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return usersDataSource.count
	}
	
	//SS: View content in cell
	//SS: Creating a cell with data from the data cource, returning it to the TableView to display
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		//SS: Catching the cell using dequeueReusableCell method to reuse a previously used cell
		let cell = tableView.dequeueReusableCell(withIdentifier: "UserCustomeTableCell", for: indexPath) as! UserCustomeTableCell
		
		//SS: Getting next data itemt to fill in the cell
		let currentUser = usersDataSource[indexPath.row]
		
		//SS: Filling the cell with data
		cell.userImageView.image = currentUser.userImage
		cell.usernameLbl.text = currentUser.userName
		cell.userAddressLbl.text = currentUser.userAddress
		
		//SS: Returning the cell to display
		return cell
	}
	
	//SS: Action handling event when TableView row is selected
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("IndexPath Section = \(indexPath.section)  Row = \(indexPath.row)")
		let selectedUser = usersDataSource[indexPath.row]
		print("User name \(selectedUser.userName)")
	}
	
}
