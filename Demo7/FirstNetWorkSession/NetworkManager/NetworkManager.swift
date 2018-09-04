//
//  NetworkManager.swift
//  FirstNetWorkSession
//
//  Created by Khaled on 9/2/18.
//  Copyright © 2018 Codex. All rights reserved.
//

import Foundation
import Alamofire



struct NetworkManager {
	
	static var sharedInstance = NetworkManager()
	
	func send(strUrl:String,params:Parameters?,
			  method:HTTPMethod = .get ,
			  completionBlock:@escaping (_ jsonResponse:[String:Any]? , _ error:String?)->Void) {
		
		Alamofire.request(strUrl,
						  method: method,
						  parameters: params,
						  encoding: JSONEncoding.default,
						  headers: nil).responseJSON { response in
							
							if let data = response.data {
								
								do {
									let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
									
									completionBlock(json, nil)
									
								} catch let error as NSError {
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
