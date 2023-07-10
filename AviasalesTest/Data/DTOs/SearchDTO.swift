//
//  SearchModel.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 8/7/23.
//

import Foundation

struct SearchDTO: Decodable {
    
    struct Origin: Decodable {
        let iata: String
        let name: String
    }

    struct TicketDestination: Decodable {
        let iata: String
        let name: String
    }

    struct SearchResultModel: Decodable, Identifiable {
        let id: String
        let departureTime: String
        let arrivalTime: String
        let price: Price
        let airline: String
        let ticketsCount: Int
        
        enum CodingKeys: String, CodingKey {
            case id
            case departureTime = "departure_date_time"
            case arrivalTime = "arrival_date_time"
            case price
            case airline
            case ticketsCount = "available_tickets_count"
        }
    }

    struct Price: Decodable {
        let currency: String
        let value: Int
    }
    
    let passengersCount: Int
    let origin: Origin
    let destination: TicketDestination
    let results: [SearchResultModel]
    
    enum CodingKeys: String, CodingKey {
        case passengersCount = "passengers_count"
        case origin
        case destination
        case results
    }
}


extension SearchDTO {
    func toEntity() -> SearchEnitity {
        let searchResultEntity = results.map {
            SearchResultEntity(id: $0.id,
                               departureTime: $0.departureTime,
                               arrivalTime: $0.arrivalTime,
                               priceCurrency: $0.price.currency,
                               priceValue: $0.price.value,
                               airline: $0.airline,
                               ticketsCount: $0.ticketsCount)
            
        }
        let result = SearchEnitity(passengerCount: passengersCount,
                                   originIata: origin.iata,
                                   originName: origin.name,
                                   destIata: destination.iata,
                                   destName: destination.name,
                                   result: searchResultEntity)

        return result
    }
}
