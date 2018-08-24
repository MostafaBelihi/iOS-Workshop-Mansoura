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
		
		//SS: Adopting protocol
        restTableView.delegate = self
        restTableView.dataSource = self
    }
	
	//SS: Static data source content
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

//SS: Protocols of TableView were adopted here in this extension instead of the first class declaration
extension RestListViewController:UITableViewDataSource,UITableViewDelegate {
	
	/*SS: Constructing the TableView */
	//SS: Number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return restDataSource.count
    }
	
	//SS: Count of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//SS: Catch the section
		let currentSection = restDataSource[section]
		//SS: Count of rows in the section
        return currentSection.restArray.count
    }
    
	//SS: View content in cell
	//SS: Creating a cell with data from the data cource, returning it to the TableView to display
	//SS: Review UserListViewController.tableView for more inner comments on this
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "RestCustomeCell",
												 for: indexPath) as! RestCustomeCell
		
		//SS: Section and row
		let currentSection = restDataSource[indexPath.section]
		let currentRest = currentSection.restArray[indexPath.row]
		
		cell.restImageView.image = UIImage(named: currentRest.restImage)
		cell.restNameLbl.text = currentRest.restName
		cell.restLatLbl.text = currentRest.restLat
		cell.restLngLbl.text = currentRest.restLng
		
		return cell
	}

	/*SS: Custom Header */
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		//SS: Catch data
        let curentSection = restDataSource[section]
		
		//SS: Catch the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCustomeCell") as! HeaderCustomeCell
		
		//SS: Add data to the cell's view
        cell.catNameLbl.text = curentSection.restCatName
        cell.contentView.backgroundColor = UIColor.red
		
		//SS: Return cell's view
		return cell.contentView
		
		/*SS: This code juts a try to create a view for the header programmatically */
		//SS: Created the view
//		let headerView = UIView(frame: CGRect(x: 0, y: 0,
//											  width: self.view.frame.width,
//											  height: 55))
		
		//SS: A label
//		let setionLbl = UILabel(frame: CGRect(x: 0, y: 0,
//											  width: headerView.frame.width,
//											  height: headerView.frame.height))
		//SS: Added label to the view
//		headerView.addSubview(setionLbl)
//		headerView.backgroundColor = UIColor.brown	//SS: Color for the view

		//SS: Return the view
//		return headerView
    }
	
	//SS: Height for Table View
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
}
