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
    
    var dataSource = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        activityIndicator.hidesWhenStopped = true
        
        populateDataSource()
    }
    
    private func populateDataSource() {
        
        activityIndicator.startAnimating()
        Alamofire.request("http://efhes.com/api/v1/services").responseJSON { response in
            
            if let data = response.data {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                    
                    let status = json["status"] as! Int
                    print("Status   😌😌😌😌  \(status)")
                    
                    self.dataSource = json["data"] as! NSArray
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
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

