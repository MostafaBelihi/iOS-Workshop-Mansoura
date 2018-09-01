
//
//  UsersListCollectionViewController.swift
//  TableViewDemo1
//
//  Created by Mohamed Abolela on 8/26/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class UsersListCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var usersCollectionView: UICollectionView!
    
    lazy var usersDataSource:[User] = [User(userImage: UIImage(named: "account_green")!, userName: "Name 0", userAddress: "Address 0"),
                                       User(userImage: UIImage(named: "account_green")!, userName: "Name 1", userAddress: "Address 1"),
                                       User(userImage: UIImage(named: "account_green")!, userName: "Name 2", userAddress: "Address 2"),
                                       User(userImage: UIImage(named: "account_green")!, userName: "Name 3", userAddress: "Address 3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersCollectionView.dataSource = self
        usersCollectionView.delegate = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right:10)
        //        layout.minimumInteritemSpacing = 20 // Horizontal spacing
        layout.minimumLineSpacing = 20 // vertical spacing
        //        layout.scrollDirection = .horizontal
        
        let screenSize = UIScreen.main.bounds
        let width = screenSize.width
        let itemWidth = (width / 2) - 20
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth) // W & H
        usersCollectionView.collectionViewLayout = layout
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let stb = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc1 = stb.instantiateViewController(withIdentifier: "UserDetailsViewController")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
//        let _ = vc.view // force loading
//        vc.user = self.usersDataSource[indexPath.row]
        present(vc, animated: true) { vc.user = self.usersDataSource[indexPath.row] }
    }
}
