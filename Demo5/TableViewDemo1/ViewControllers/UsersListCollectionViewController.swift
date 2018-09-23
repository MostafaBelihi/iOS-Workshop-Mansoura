
//
//  UsersListCollectionViewController.swift
//  TableViewDemo1
//
//  Created by Mohamed Abolela on 8/26/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class UsersListCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
	
	//SS: CollectionView
    @IBOutlet weak var usersCollectionView: UICollectionView!
	
	//SS: Data source
    lazy var usersDataSource:[User] = [User(userImage: UIImage(named: "account_green")!, userName: "Name 0", userAddress: "Address 0"),
                                       User(userImage: UIImage(named: "account_green")!, userName: "Name 1", userAddress: "Address 1"),
                                       User(userImage: UIImage(named: "account_green")!, userName: "Name 2", userAddress: "Address 2"),
                                       User(userImage: UIImage(named: "account_green")!, userName: "Name 3", userAddress: "Address 3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//SS: Adopting protocol
        usersCollectionView.dataSource = self
        usersCollectionView.delegate = self
		
		///SS: Flow of items in CollectionView
		//SS: instance of UICollectionViewFlowLayout will be used to configure some of UI properties for the CollectionView
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right:10)
        //        layout.minimumInteritemSpacing = 20 // Horizontal spacing
        layout.minimumLineSpacing = 20 // vertical spacing
        //        layout.scrollDirection = .horizontal
		
		//SS: Getting values of some view properties from device's screen
        let screenSize = UIScreen.main.bounds
        let width = screenSize.width
        let itemWidth = (width / 2) - 20
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth) // W & H
		
		//SS: Assigning set layout properties to the CollectionView
		usersCollectionView.collectionViewLayout = layout
    }
	
	///SS: Normal CollectionView implementation just like the TableView (all next methods)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersDataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionCell", for: indexPath) as! UserCollectionCell
        cell.user = usersDataSource[indexPath.row]
        
//        cell.setupWithUser(user: usersDataSource[indexPath.row])
        
//        let current = usersDataSource[indexPath.row]
//        cell.userNameLbl.text = current.userName
//        cell.userImageView.image = current.userImage
        return cell
    }
	
	//SS: Navigating to details view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let stb = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc1 = stb.instantiateViewController(withIdentifier: "UserDetailsViewController")
		
		//SS: Instantiating target view to present next
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
//        let _ = vc.view // force loading
//        vc.user = self.usersDataSource[indexPath.row]
		//SS: Presenting next view, passing data using view_did_loaded action in the third argument here
        present(vc, animated: true) { vc.user = self.usersDataSource[indexPath.row] }
    }
}
