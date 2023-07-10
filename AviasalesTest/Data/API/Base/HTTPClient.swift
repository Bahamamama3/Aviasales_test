//
//  HTTPClient.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 8/7/23.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: EndpointScheme, responseModel: T.Type) async -> Result<T, RequestError>
}

extension HTTPClient {
    func sendRequest<T: Decodable>(endpoint: EndpointScheme, responseModel: T.Type) async -> Result<T, RequestError> {
        let request = try! endpoint.asURLRequest()
     
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodeResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }

                return .success(decodeResponse)
            case 400:
                return .failure(.badRequest)
            case 401:
                return .failure(.unauthorized)
            case 403:
                return .failure(.forbidden)
            case 500:
                return .failure(.unexpectedStatusCode)
            default:
                return .failure(.unknown)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}

