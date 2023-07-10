//
//  Date.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 9/7/23.
//

import Foundation

extension Date {
    func getString(dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale(identifier: "ru-RU")
        let string = formatter.string(from: self)
        return string
    }
}
