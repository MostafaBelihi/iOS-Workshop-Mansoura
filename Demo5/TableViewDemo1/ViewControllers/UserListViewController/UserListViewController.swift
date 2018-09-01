//
//  UserListViewController.swift
//  TableViewDemo1
//
//  Created by Mahmoud Ibaraheim on 8/8/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var usersTableView: UITableView!
    
    lazy var usersDataSource:[User] = [User(userImage: UIImage(named: "account_green")!, userName: "Name 0", userAddress: "Address 0"),
                                       User(userImage: UIImage(named: "account_green")!, userName: "Name 1", userAddress: "Address 1"),
                                       User(userImage: UIImage(named: "account_green")!, userName: "Name 2", userAddress: "Address 2"),
                                       User(userImage: UIImage(named: "account_green")!, userName: "Name 3", userAddress: "Address 3")]
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.dataSource = self
        usersTableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCustomeTableCell", for: indexPath) as! UserCustomeTableCell
        let currentUser = usersDataSource[indexPath.row]
        cell.userImageView.image = currentUser.userImage
        cell.usernameLbl.text = currentUser.userName
        cell.userAddressLbl.text = currentUser.userAddress
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath Section = \(indexPath.section)  Row = \(indexPath.row)")
        let selectedUser = usersDataSource[indexPath.row]
        print("User name \(selectedUser.userName)")
    }

}
