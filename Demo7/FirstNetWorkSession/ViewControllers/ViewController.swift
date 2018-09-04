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
	
	var dataSource = [Item]()
	
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
		
		NetworkManager.sharedInstance.send(strUrl: "http://efhes.com/api/v1/services",
										   params: nil)
		{ [unowned self] (response,error) in
			
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
			
			let dataArray = response!["data"] as! NSArray
			self.dataSource = dataArray.map({ Item(dict: $0 as! [String : Any]) })
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

