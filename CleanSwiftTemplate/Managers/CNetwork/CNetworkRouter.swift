//
//  CNetworkRouter.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 31.03.2024.
//

import Foundation
import Alamofire

enum CNetworkRouter: URLRequestConvertible {
    
    case rockets
    case rocket(rocketID: String)
    
    public var method: HTTPMethod {
        switch self {
        case .rockets, .rocket:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .rockets:
            return "/rockets"
        case .rocket(let id):
            return "/rockets/\(id)"
        }
    }
    
    public var parameters: Parameters? {
        switch self {
        case .rockets, .rocket:
            return nil
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try NetworkConstants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.headers = [HTTPHeader.contentType(ContentType.json.rawValue)]
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
    
    
}
