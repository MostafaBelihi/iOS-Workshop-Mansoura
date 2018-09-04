//
//  ViewController.swift
//  FirstNetWorkSession
//
//  Created by Khaled on 8/29/18.
//  Copyright © 2018 Codex. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
	
	//SS: UI Elements
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	var dataSource = NSArray()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//SS: Adopters for UITableView
		tableView.dataSource = self
		tableView.delegate = self
		
		activityIndicator.hidesWhenStopped = true
		
		populateDataSource()
	}
	
	private func populateDataSource() {
		activityIndicator.startAnimating()
		
		//SS: Remote request
		Alamofire.request("http://efhes.com/api/v1/services").responseJSON { response in
			if let data = response.data {
				//SS: Handle response
				do {
					//SS: Decode JSON response
					let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]	//SS:: dictionary
					
					let status = json["status"] as! Int
					print("Status   😌😌😌😌  \(status)")
					
					//SS: Catch data from response
					self.dataSource = json["data"] as! NSArray
					
					//SS: Use data as datasource for TableView
					self.tableView.reloadData()
					
					self.activityIndicator.stopAnimating()
					
				}
				catch let error as NSError {
					print("Failed to load: \(error.localizedDescription)")
				}
			}
		}
		
	}
	
	//SS: TableView implementation
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		//SS: Bind
		let current = dataSource[indexPath.row] as! [String:Any]
		let serviceName = current["name"] as! String
		(cell.contentView.viewWithTag(10) as! UILabel).text = serviceName
		return cell
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}

