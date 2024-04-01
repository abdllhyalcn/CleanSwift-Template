//
//  RocketResponseModel.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 1.04.2024.
//

import Foundation

struct RocketsResponseModel: Codable {
    let id: Int
    let flickrImages: [String]
    let wikipedia: String
    let rocketDescription, rocketID, rocketName, rocketType: String

    enum CodingKeys: String, CodingKey {
        case id
        case flickrImages = "flickr_images"
        case wikipedia
        case rocketDescription = "description"
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
    }
}
