//
//  SearchEnitity.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 9/7/23.
//

import Foundation
import SwiftUI

struct SearchEnitity {
    let passengerCount: Int
    let originIata: String
    let originName: String
    let destIata: String
    let destName: String
    var result: [SearchResultEntity]
    
    var flightText: String { "\(originName) - \(destName)"}
    var flightDescr: String { "\(result[0].fullDate), \(passengerCount) чел"}
    var bestPriceText: String { "Лучшая цена за \(passengerCount) чел"}
}
