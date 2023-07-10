//
//  MainViewRow.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 10/7/23.
//

import SwiftUI

struct Row: View {
    let fullEntity: SearchEnitity
    let searchResultEntity: SearchResultEntity
    
    var body: some View {
        ZStack(alignment: .leading) {
            let viewModel = DetailsViewModel(fullEnitity: fullEntity,
                                             searchResult: searchResultEntity)
            NavigationLink(destination: DetailsView(viewModel: viewModel)) {
                Rectangle()
                    .fill(AppColors.rowColor)
                    .cornerRadius(14)
            }
            .navigationTitle("Все билеты")
            
            if let cheapestBadge = searchResultEntity.cheapestBadge {
                VStack {
                    Text(cheapestBadge)
                        .padding(EdgeInsets(top: 2,
                                            leading: 8,
                                            bottom: 2,
                                            trailing: 8))
                        .background(Color.green)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(EdgeInsets(top: -10,
                                    leading: 18,
                                    bottom: 0,
                                    trailing: 18))
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(searchResultEntity.price)
                        .foregroundColor(.blue)
                        .font(.system(size: 19,
                                      weight: .bold))
                    Spacer()
                    
                    Image(searchResultEntity.iconName)
                        .cornerRadius(32)
                }
                
                if let ticketsCountAlert = searchResultEntity.ticketsCountAlert {
                    Text(ticketsCountAlert)
                        .foregroundColor(.red)
                        .font(.system(size: 13,
                                      weight: .regular))
                    Spacer()
                }
                
                
                CityAndDateView(city: fullEntity.originName,
                                code: fullEntity.originIata,
                                time: searchResultEntity.depTime,
                                date: searchResultEntity.depDate)
                Spacer()
                
                CityAndDateView(city: fullEntity.destName,
                                code: fullEntity.destIata,
                                time: searchResultEntity.arrTime,
                                date: searchResultEntity.arrDate)
            }
            .padding(EdgeInsets(top: 16,
                                leading: 16,
                                bottom: 16,
                                trailing: 16))
        }
        .padding(EdgeInsets(top: 0,
                            leading: 16,
                            bottom: 0,
                            trailing: 16))
    }
}
