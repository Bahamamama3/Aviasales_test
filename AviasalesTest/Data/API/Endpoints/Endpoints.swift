//
//  Endpoints.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 8/7/23.
//

import Foundation

enum Endpoints {
    case search(origin: String, destination: String)
}

extension Endpoints: EndpointScheme {
    
    var path: String {
        switch self {
        case .search:
            return "/api/search"
        }
    }
    
    var method: RequestMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var queries: [URLQueryItem]? {
        switch self {
        case let .search(origin, destination):
            return [URLQueryItem(name: "origin", value: "\(origin)"),
            URLQueryItem(name: "destination", value: "\(destination)")]
        }
    }
    
    var header: [String: String]? {
        switch self {
        default:
            return ["Content-Type":"application/json",
                    "Accept": "application/json"]
        }
    }
    
    var body: [String : Any]? {
        return nil
    }
}

