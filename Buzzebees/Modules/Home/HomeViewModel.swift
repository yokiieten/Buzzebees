//
//  HomeViewModel.swift
//  Buzzebees
//
//  Created by Sahassawat on 12/7/2566 BE.
//

import Foundation

enum HomeSectionViewType {
    case signIn
    case picture
    case newsAndPromotion
    case privileges
    
    static func viewType(by index: Int) -> HomeSectionViewType? {
        switch index {
        case 0: return .signIn
        case 1: return .picture
        case 2: return .newsAndPromotion
        case 3: return .privileges
        default: return nil
        }
    }
    
    static var allCases: [HomeSectionViewType] {
        let cases: [HomeSectionViewType] = [.signIn, .picture, .newsAndPromotion, .privileges]
        return cases
    }
}

class HomeViewModel {
    var infoHome: [InfoHomeResponse]? = []
    var newsAndPromotionViewModel = NewsAndPromotionViewModel()
    var bannerViewModel = BannerViewModel()
    var didLoadData: (() -> Void)?
    
    func fetchInfoHome() {
        let target = InfoHomeTargetType.getInfoHome
        MoyaService<[InfoHomeResponse]?>.getRequest(target: target) { [weak self] result in
            switch result {
                
            case .success(result: let result):
                self?.infoHome = result
                self?.createViewModel()
            case .failure(error: let error):
                print("ErrorServer", error.localizedDescription)
            }
        }
    }
    func createViewModel() {
        guard let infoHome = infoHome else { return }
        for home in infoHome {
            if home.type == "campaign_rotate" {
                if let subCampaignDetails = home.subCampaignDetails {
                    for sub in subCampaignDetails {
                        bannerViewModel.image?.append(sub.imageUrl ?? "")
                    }
                }
            }
                
                if let config = home.config, config == "campaign_lawson108_news" {
                    newsAndPromotionViewModel.title = home.catHeaderEn
                    if !config.isEmpty {
                        fetchPromotion(completion: { [weak self] result in
                            switch result {
                            case .success(let result):
                                if let response = result {
                                    for promotion in response {
                                        self?.newsAndPromotionViewModel.image?.append(promotion.fullImageUrl ?? "")
                                        self?.didLoadData?()
                                    }
                                }
                            case .failure(error: let error):
                                print(error)
                            }
                        })
                    }
                }
        }
    }
        func fetchPromotion(completion: @escaping (Result<[PromotionResponse]?>) ->()) {
            let target = InfoHomeTargetType.getPromotion
            MoyaService<[PromotionResponse]?>.getRequest(target: target) { result in
                switch result {
                    
                case .success(result: let result):
                    completion(.success(result: result))
                case .failure(error: let error):
                    completion(.failure(error: error))
                }
            }
        }
        
        //    func combineData() {
        //        for home in infoHome {
        //            hom
        //        }
        //    }
        
    }

struct BannerViewModel {
    var image: [String]?
}

struct NewsAndPromotionViewModel {
    var title: String?
    var image: [String]? = []
}
