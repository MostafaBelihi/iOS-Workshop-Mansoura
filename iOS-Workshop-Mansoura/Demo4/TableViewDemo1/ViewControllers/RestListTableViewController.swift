//
//  RestListTableViewController.swift
//  TableViewDemo1
//
//  Created by Mohamed Abolela on 8/15/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class RestListTableViewController: UITableViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    lazy var restDataSource:[RestCategory] = [RestCategory]()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCatsDataSource()
    }

    private func prepareCatsDataSource() {
        let cat0 = RestCategory(restCatName: "Restraunts",
                                restArray: [Restaraunt(restName: "Ahl Sham",
                                                       restImage: "personal_info_green",
                                                       restLat: "31.343",
                                                       restLng: "31.676"),
                                            
                                            Restaraunt(restName: "Hlw Sham",
                                                       restImage: "personal_info_green",
                                                       restLat: "31.343",
                                                       restLng: "31.676")])
        
        
        
        let cat1 = RestCategory(restCatName: "Drinks",
                                restArray: [Restaraunt(restName: "Mazagat",
                                                       restImage: "personal_info_green",
                                                       restLat: "31.343",
                                                       restLng: "31.676"),
                                            
                                            Restaraunt(restName: "Alhussien",
                                                       restImage: "personal_info_green",
                                                       restLat: "31.343",
                                                       restLng: "31.676"),
                                            
                                            Restaraunt(restName: "Piro",
                                                       restImage: "personal_info_green",
                                                       restLat: "31.343",
                                                       restLng: "31.676")])
        
        
        restDataSource.append(cat0)
        restDataSource.append(cat1)
    }
    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return restDataSource.count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let currentSection = restDataSource[section]
//        return currentSection.restArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "RestCustomeCell",
//                                                 for: indexPath) as! RestCustomeCell
//        
//        let currentSection = restDataSource[indexPath.section]
//        let currentRest = currentSection.restArray[indexPath.row]
//        
//        cell.restImageView.image = UIImage(named: currentRest.restImage)
//        cell.restNameLbl.text = currentRest.restName
//        cell.restLatLbl.text = currentRest.restLat
//        cell.restLngLbl.text = currentRest.restLng
//
//        return cell
//    }
// 


}
