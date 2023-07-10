//
//  SearchResultEntity.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 9/7/23.
//

import Foundation
import SwiftUI

struct SearchResultEntity: Identifiable {
    
    enum Currency: String {
        case rub = "RUB"
        
        var sign: String {
            switch self {
            case .rub:
                return "₽"
            }
        }
    }
    
    let id: String
    private let departureTime: Date
    private let arrivalTime: Date
    private let priceCurrency: String
    private let priceValue: Int
    let airline: String
    private let ticketsCount: Int
    private(set) var isCheapest = false
    
    var ticketsCountAlert: String? {
        if ticketsCount < 10 {
            return "Осталось \(ticketsCount) билетов по этой цене"
        }
        return nil
    }
    
    var price: String { String(priceValue) + " " + "\(Currency(rawValue: priceCurrency)!.sign)" }
    
    var depDate: String { departureTime.getString(dateFormat: "d MMM, EE") }
    var depTime: String { departureTime.getString(dateFormat: "HH:mm") }

    var arrDate: String { arrivalTime.getString(dateFormat: "d MMM, EE") }
    var arrTime: String { arrivalTime.getString(dateFormat: "HH:mm") }
    
    var fullDate: String { departureTime.getString(dateFormat: "d MMMM") }
    
    var iconName: String { "icon/\(airline)" }
    var cheapestBadge: String? { isCheapest ? "Самый дешевый" : nil }

    var buttonTitle: String { "Купить билет за \(price)"}
    var buyAlertTitle: String { "Вы купили билет за \(price)"}
    
    init(id: String, departureTime: String, arrivalTime: String, priceCurrency: String, priceValue: Int, airline: String, ticketsCount: Int) {
        self.id = id
        self.departureTime = departureTime.getDateFrom(dateFormat: "yyyy-MM-dd HH:mm")!
        self.arrivalTime = arrivalTime.getDateFrom(dateFormat: "yyyy-MM-dd HH:mm")!
        self.priceCurrency = priceCurrency
        self.priceValue = priceValue
        self.airline = airline
        self.ticketsCount = ticketsCount
    }
    
    
    mutating func setAsCheapest() {
        isCheapest = true
    }
}
