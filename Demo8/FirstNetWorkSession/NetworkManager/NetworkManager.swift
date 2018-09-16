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
	
	func sendCodable<T:Codable>(_ decoder: T.Type,
								path:String,
								httpMethod:HTTPMethod,
								params:[String:String]?,
								completionBlock:@escaping (_ response:T)->Void) {
		
		Alamofire.request(path,
						  method: httpMethod,
						  parameters: params,
						  encoding: JSONEncoding.default,
						  headers: nil).responseData { (response) in
							switch response.result {
							case .failure(let error):
								print("Connection error  \(error.localizedDescription) 😁😁😁😁😁😁")
							case .success(let value):
								
								do {
									let obj = try JSONDecoder().decode(T.self, from: value)
									completionBlock(obj)
									
								} catch let jsonError {
									print("JsonSerial Error  \(jsonError.localizedDescription)")
								}
							}
		}
	}
	
	
	
	func send(strUrl:String,
			  params:Parameters?,
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
	
}


//import Foundation
//import Alamofire
//
//
//
//struct NetworkManager {
//
//    static var sharedInstance = NetworkManager()
//
//
//}



