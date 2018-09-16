//
//  HomeResponse.swift
//  FirstNetWorkSession
//
//  Created by Khaled on 9/12/18.
//  Copyright © 2018 Codex. All rights reserved.
//

import Foundation

struct HomeResponse: Codable {
    let status: Int?
    let data: [ServiceItem]?
}

struct ServiceItem: Codable {
    let id: Int?
    let name, brief: String?
    let vinRequired, elegantService: Int?
    let photo: String?
    let reportURL: String?
    let advantages: [Advantage]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, brief
        case vinRequired = "vin_required"
        case elegantService = "elegant_service"
        case photo
        case reportURL = "report_url"
        case advantages
    }
}

struct Advantage: Codable {
    let id: Int?
    let name: String?
    let serviceID: Int?
    let photo: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case serviceID = "service_id"
        case photo
    }
}
