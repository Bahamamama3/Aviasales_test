//
//  EndpointScheme.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 8/7/23.
//

import Foundation

protocol EndpointScheme {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queries: [URLQueryItem]? { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
    
}

extension EndpointScheme {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "nu.vsepoka.ru"
    }
    
    func asURLRequest() throws -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        
        if queries != nil {
            urlComponents.queryItems = queries
        }
        
        guard let url = urlComponents.url else { throw RequestError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header
        
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        return request
    }
}
