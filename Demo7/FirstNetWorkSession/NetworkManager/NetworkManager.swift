//
//  NetworkManager.swift
//  FirstNetWorkSession
//
//  Created by Khaled on 9/2/18.
//  Copyright © 2018 Codex. All rights reserved.
//

///SSS:: File Commented

import Foundation
import Alamofire

//SS: Encapsulation for network related functions
struct NetworkManager {
	
	//SS: Static singleton for the class
	static var sharedInstance = NetworkManager()
	
	//SS: Sends request and handles its response
	func send(strUrl:String,		//SS: Request URL
		params:Parameters?,			//SS: Parameters
		method:HTTPMethod = .get ,	//SS: Method
		completionBlock:@escaping (_ jsonResponse:[String:Any]? , _ error:String?)->Void) {
		//SS: Closure to which response will be handed
		// jsonResponse is a Dictionary to handle JSON object
		
		//SS: Making request
		Alamofire.request(strUrl,
						  method: method,
						  parameters: params,
						  encoding: JSONEncoding.default,
						  headers: nil).responseJSON { response in	//SS: Lambda expression like (x => x) in C#
							if let data = response.data {
								//SS: Success
								do {
									//SS: Serialize JSON object
									let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
									
									//SS: Hand response to passed closure
									completionBlock(json, nil)
								}
								//SS: Error
								catch let error as NSError {
									//SS: Hand response to passed closure
									completionBlock(nil , error.localizedDescription)
								}
							}
		}
	}
	
	//    func send(strUrl:String,
	//              completionBlock:@escaping (_ jsonResponse:[String:Any]? , _ error:String?)->Void) {
	//
	//        Alamofire.request(strUrl).responseJSON { response in
	//
	//            if let data = response.data {
	//
	//                do {
	//                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
	//
	//                    completionBlock(json, nil)
	//
	//                } catch let error as NSError {
	//                    completionBlock(nil , error.localizedDescription)
	//                }
	//            }
	//        }
	//    }
}
