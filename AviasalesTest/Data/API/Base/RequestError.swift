//
//  RequestError.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 8/7/23.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case forbidden
    case badRequest
    case unexpectedStatusCode
    case unknown
    
    var message: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        case .badRequest:
            return "Bad Request"
        case .forbidden:
            return "Forbidden"
        default:
            return "Unknown error"
        }
    }
}
