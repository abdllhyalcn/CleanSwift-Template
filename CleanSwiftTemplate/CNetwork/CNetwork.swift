//
//  CNetwork.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 31.03.2024.
//

import Foundation
import KRProgressHUD
import Alamofire

protocol CNetworkManagerProtocol {
    var saom: Int {
        get
    }
    func execute<M: Codable>(requestRoute: CNetworkRouter,
                             responseModel: M.Type,
                             isLoaderActive: Bool,
                             completion: @escaping (Swift.Result<M, CNetworkError>) -> Void)
}

extension CNetworkManagerProtocol {
    var saom: Int {
        get { return 4}
    }
}

final class CNetwork: CNetworkManagerProtocol {
    
    func execute<M: Decodable>(requestRoute: CNetworkRouter, responseModel: M.Type, isLoaderActive: Bool = true, completion: @escaping (Swift.Result<M, CNetworkError>) -> Void) {
        
        if isLoaderActive {
            KRProgressHUD.show()
        }
        
        do {
            let urlRequest = try requestRoute.asURLRequest()
            AF.request(urlRequest).validate().responseDecodable(of: responseModel) { response in
                KRProgressHUD.dismiss()
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(.parseError))
                }
            }
        } catch {
            completion(.failure(.badUrlError))
        }
    }
}
