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
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	var dataSource = [ServiceItem]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.dataSource = self
		tableView.delegate = self
		tableView.estimatedRowHeight = 400
		tableView.rowHeight = UITableViewAutomaticDimension
		
		populateDataSource()
		activityIndicator.hidesWhenStopped = true
		
	}
	
	private func populateDataSource() {
		
		activityIndicator.startAnimating()
		let path = "http://efhes.com/api/v1/services"
		NetworkManager.sharedInstance.sendCodable(HomeResponse.self,
												  	//SS: Passing the type to be decoded to
												  path: path,
												  httpMethod: .get,
												  params: nil)
		{ (response) in
			self.dataSource = response.data ?? []
			self.tableView.reloadData()
			self.activityIndicator.stopAnimating()
		}
		
	}
	
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

