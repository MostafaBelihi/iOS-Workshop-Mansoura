//
//  RestListViewController.swift
//  TableViewDemo1
//
//  Created by Mohamed Abolela on 8/15/18.
//  Copyright © 2018 MahmoudOrganization. All rights reserved.
//

import UIKit

class RestListViewController: UIViewController {
    
    @IBOutlet weak var restTableView: UITableView!
    
    lazy var restDataSource:[RestCategory] = [RestCategory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCatsDataSource()
        restTableView.delegate = self
        restTableView.dataSource = self
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
}

extension RestListViewController:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return restDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = restDataSource[section]
        return currentSection.restArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let curentSection = restDataSource[section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCustomeCell") as! HeaderCustomeCell
        
        cell.catNameLbl.text = curentSection.restCatName
        cell.contentView.backgroundColor = UIColor.red
        return cell.contentView
        //        let headerView = UIView(frame: CGRect(x: 0, y: 0,
        //                                              width: self.view.frame.width,
        //                                              height: 55))
        //
        //        let setionLbl = UILabel(frame: CGRect(x: 0, y: 0,
        //                                              width: headerView.frame.width,
        //                                              height: headerView.frame.height))
        //        headerView.addSubview(setionLbl)
        //        headerView.backgroundColor = UIColor.brown
        //
        //        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestCustomeCell",
                                                 for: indexPath) as! RestCustomeCell

        let currentSection = restDataSource[indexPath.section]
        let currentRest = currentSection.restArray[indexPath.row]

        cell.restImageView.image = UIImage(named: currentRest.restImage)
        cell.restNameLbl.text = currentRest.restName
        cell.restLatLbl.text = currentRest.restLat
        cell.restLngLbl.text = currentRest.restLng
        
        return cell
    }
}
