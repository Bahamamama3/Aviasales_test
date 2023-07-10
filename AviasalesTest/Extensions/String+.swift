//
//  String.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 9/7/23.
//

import Foundation

extension String {
    func getDateFrom(dateFormat: String = "yyyy-MM-dd HH:mm") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale(identifier: "ru-RU")
        guard let date = formatter.date(from: self) else {
            return nil
        }
        return date
    }
}
