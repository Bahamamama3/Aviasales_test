//
//  CityAndDateView.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 10/7/23.
//

import SwiftUI

struct CityAndDateView: View {
    
    let city: String
    let code: String
    let time: String
    let date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(city)
                    .font(.system(size: 15,
                                  weight: .bold))
                
                Text(code)
                    .font(.system(size: 13,
                                  weight: .regular))
                    .opacity(0.5)
            }
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(time)
                    .font(.system(size: 15,
                                  weight: .bold))
                Text(date)
                    .font(.system(size: 13,
                                  weight: .regular))
                    .opacity(0.5)
            }
        }
    }
}
