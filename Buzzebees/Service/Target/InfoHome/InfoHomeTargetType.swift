//
//  InfoHomeTargetType.swift
//  Buzzebees
//
//  Created by Sahassawat on 13/7/2566 BE.
//

import Moya

enum InfoHomeTargetType {
    case getInfoHome

}

extension InfoHomeTargetType: TargetType {
    var path: String {
        switch self {
        case .getInfoHome:
            return "/b/PQIO"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getInfoHome:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .getInfoHome:
            return .requestPlain
        }
    }
}

