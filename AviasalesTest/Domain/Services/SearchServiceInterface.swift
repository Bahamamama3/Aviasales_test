//
//  SearchServiceInterface.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 10/7/23.
//

import Foundation

protocol SearchServiceInterface {
    func getSearchData(origin: String, destination: String) async -> Result<SearchEnitity, RequestError>
}
