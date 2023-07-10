//
//  SearchService.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 8/7/23.
//

import Foundation

struct SearchService: HTTPClient, SearchServiceInterface {
    func getSearchData(origin: String, destination: String) async -> Result<SearchEnitity, RequestError> {
        await sendRequest(endpoint: Endpoints.search(origin: origin,
                                                     destination: destination),
                          responseModel: SearchDTO.self).map { $0.toEntity() }
    }
}
