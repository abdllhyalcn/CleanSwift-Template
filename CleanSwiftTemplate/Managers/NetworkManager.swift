//
//  NetworkManager.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 1.04.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    
    public var localizedDescription: String { get {
        switch self {
        case .invalidURL:
            return String(localized: "network.error.invalid.url")
        case .invalidResponse:
            return String(localized: "network.error.invalid.response")
        }
    }}
}

enum DataURLEnum: String {
    case rocketList = "https://api.spacexdata.com/v3/rockets"
}

protocol NetworkManagerProtocol {
    func dataTask<T: Decodable>(_ urlEnum: DataURLEnum, _ type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    func dataTask<T: Decodable>(_ urlEnum: DataURLEnum, _ type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlEnum.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let res = try? JSONDecoder().decode(T.self, from: data)  {
                DispatchQueue.main.async {
                    completion(.success(res))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
            }
        }.resume()
    }
}
