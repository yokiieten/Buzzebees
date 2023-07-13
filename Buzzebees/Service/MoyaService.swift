//
//  MoyaService.swift
//  The RickandMortyAPI
//
//  Created by Sahassawat on 15/2/2565 BE.
//

import Moya

var provider = MoyaProvider<MultiTarget>()

class MoyaService<Response: Decodable> {
    
    static func getRequest(target: TargetType , completion: @escaping (Result<Response>) -> Void) {
        
        let multiTargetType = MultiTarget(target)
        provider.request(multiTargetType) { result in
            switch result {
                
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    print("statusCode", response.response?.statusCode)
                    let Response = try decoder.decode(Response.self, from: response.data)
                    completion(.success(result: Response))
                } catch(let error) {
                    print(String(describing: error))
                    completion(.failure(error: error))
                }
            case .failure(let error):
                completion(.failure(error: error))
            }
        }
    }
}
