//
//  DetailViewModel.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 9/7/23.
//

import Foundation

protocol DetailsViewModelInterface: ObservableObject {
    var fullEnitity: SearchEnitity { get set }
    var searchResult: SearchResultEntity { get set }
}

final class DetailsViewModel: DetailsViewModelInterface {
    var fullEnitity: SearchEnitity
    var searchResult: SearchResultEntity
    init(fullEnitity: SearchEnitity, searchResult: SearchResultEntity) {
        self.fullEnitity = fullEnitity
        self.searchResult = searchResult
    }
}

final class PreviewDetailsViewModel: DetailsViewModelInterface {
    var searchResult: SearchResultEntity = SearchResultEntity(id: "", departureTime: "2023-07-09 12:12", arrivalTime: "2023-07-09 12:12", priceCurrency: "SOM", priceValue: 1, airline: "", ticketsCount: 1)
    
    var fullEnitity: SearchEnitity = SearchEnitity(passengerCount: 1, originIata: "", originName: "", destIata: "", destName: "", result: [])
}
