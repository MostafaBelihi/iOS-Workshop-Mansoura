//
//  ViewController.swift
//  FirstNetWorkSession
//
//  Created by Khaled on 8/29/18.
//  Copyright © 2018 Codex. All rights reserved.
//

///SSS:: File Commented

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	//SS: Array of model
	var dataSource = [Item]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//SS: TableView Adopters
		tableView.dataSource = self
		tableView.delegate = self
		
		tableView.estimatedRowHeight = 400	//SS: Review its Quick Help
		tableView.rowHeight = UITableViewAutomaticDimension	//SS: Review its Quick Help
		
		populateDataSource()
		activityIndicator.hidesWhenStopped = true
		
	}
	
	private func populateDataSource() {
		activityIndicator.startAnimating()
		
		//SS: Calling service using our NetworkManager
		NetworkManager.sharedInstance.send(strUrl: "http://efhes.com/api/v1/services",
										   params: nil)
		{ [unowned self] (response,error) in
			//SS: Closure that will handle response
			
			//SS: Handle error
			if let strError = error {
				let alert = UIAlertController(title: "Info !",
											  message: strError,
											  preferredStyle: .alert)
				
				let okACtion = UIAlertAction(title: "OK",
											 style: .default,
											 handler: nil)
				
				alert.addAction(okACtion)
				self.present(alert, animated: true, completion: nil)
				return
			}
			
			//SS: Handle success response
			//SS: Array of Dictionaries (JSON objects)
			let dataArray = response!["data"] as! NSArray
			
			//SS: Assign response array to TableView data source
			/*SS:
				The map function maps every element in the mapped array to new implementation
				in its argument. Here it uses constructor of Item model to map data in
				every Dictionary to properties of the model (model constructor does that).
			*/
			self.dataSource = dataArray.map({ Item(dict: $0 as! [String : Any]) })
			
			//SS: Important to load new data in TableView
			self.tableView.reloadData()
			
			self.activityIndicator.stopAnimating()
		}
		
		
		//        NetworkManager.sharedInstance.send(strUrl: "http://efhes.com/api/v1/services")
		//        { [unowned self] (response,error) in
		//
		//            if let strError = error {
		//
		//                let alert = UIAlertController(title: "Info !",
		//                                              message: strError,
		//                                              preferredStyle: .alert)
		//
		//                let okACtion = UIAlertAction(title: "OK",
		//                                             style: .default,
		//                                             handler: nil)
		//
		//                alert.addAction(okACtion)
		//                self.present(alert, animated: true, completion: nil)
		//                return
		//            }
		//
		//            let dataArray = response!["data"] as! NSArray
		//            self.dataSource = dataArray.map({ Item(dict: $0 as! [String : Any]) })
		//            self.tableView.reloadData()
		//            self.activityIndicator.stopAnimating()
		//        }
	}
	
	//SS: TableView implementations
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCustomeCell",
												 for: indexPath) as! ItemCustomeCell
		
		let current = dataSource[indexPath.row]
		cell.configurerWithItem(item: current)
		
		//        let serviceName = current.name
		//        (cell.contentView.viewWithTag(10) as! UILabel).text = serviceName
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}

