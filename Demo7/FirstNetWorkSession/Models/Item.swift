//
//  Item.swift
//  FirstNetWorkSession
//
//  Created by Khaled on 9/2/18.
//  Copyright © 2018 Codex. All rights reserved.
//

///SSS:: File Commented

import Foundation

struct Item {
	
	var id:String!
	var name:String!
	var details:String!
	var imageUrl:String!
	
	//SS: Constructor binds incoming Dictionary to model instance
	init(dict:[String:Any]) {
		self.id = dict["id"] as? String ?? ""
		self.name = dict["name"] as? String ?? ""
		self.details = dict["brief"] as? String ?? ""
		self.imageUrl = dict["photo"] as? String ?? ""
	}
	
}
