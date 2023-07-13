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
    var infoHome: [InfoHomeResponse?] = []
    var didLoadData: (() -> Void)?
    
    func fetchInfoHome() {
        let target = InfoHomeTargetType.getInfoHome
        MoyaService<[InfoHomeResponse?]>.getRequest(target: target) { [weak self] result in
            switch result {
                
            case .success(result: let result):
                self?.infoHome = result
                self?.didLoadData?()
            case .failure(error: let error):
                print("ErrorServer", error.localizedDescription)
            }
        }
    }
    
}
