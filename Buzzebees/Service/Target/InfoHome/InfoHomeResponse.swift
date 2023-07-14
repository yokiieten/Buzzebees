//
//  InfoHomeResponse.swift
//  Buzzebees
//
//  Created by Sahassawat on 13/7/2566 BE.
//

import Foundation

struct InfoHomeResponse: Codable {
    let type: String?
    let catHeaderEn: String?
    let config: String?
    let subCampaignDetails: [SubCampaignDetails]?
    let line1: String?
    let line2: String?
    let line3: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case catHeaderEn = "cat_header_en"
        case config = "config"
        case subCampaignDetails = "subcampaigndetails"
        case line1 = "line1"
        case line2 = "line2"
        case line3 = "line3"
        case imageUrl = "image_url"
    }
}

struct SubCampaignDetails: Codable {
    
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
    }
    
}

struct PromotionResponse: Codable {
    let fullImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case fullImageUrl = "FullImageUrl"
    }
}
