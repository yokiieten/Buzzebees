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
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case catHeaderEn = "cat_header_en"
        case config = "config"
        case subCampaignDetails = "subcampaigndetails"
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
