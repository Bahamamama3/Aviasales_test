//
//  DetailsView.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 8/7/23.
//

import SwiftUI

struct DetailsView<ViewModel: DetailsViewModelInterface>: View {
    
    @State private var presentAlert = false
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack(alignment: .center) {
                        Text(viewModel.searchResult.price)
                            .font(.system(size: 34,
                                          weight: .bold))
                        
                        Text(viewModel.fullEnitity.bestPriceText)
                            .font(.system(size: 13,
                                          weight: .light))
                    }
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.fullEnitity.flightText)
                            .font(.system(size: 17,
                                          weight: .bold))
                            .padding(EdgeInsets(top: 0,
                                                leading: 0,
                                                bottom: 0,
                                                trailing: 0))
                        VStack {
                            HStack(alignment: .center) {
                                Image(viewModel.searchResult.iconName)
                                    .cornerRadius(32)
                                    .padding(EdgeInsets(top: 10,
                                                        leading: 12,
                                                        bottom: 0,
                                                        trailing: 0))
                                
                                Text(viewModel.searchResult.airline)
                                    .font(.system(size: 15, weight: .semibold))
                                    .padding(EdgeInsets(top: 10,
                                                        leading: 12,
                                                        bottom: 0,
                                                        trailing: 0))
                                Spacer()
                            }
                            
                            CityAndDateView(city: viewModel.fullEnitity.originName,
                                            code: viewModel.fullEnitity.originIata,
                                            time: viewModel.searchResult.depTime,
                                            date: viewModel.searchResult.depDate)
                            .padding(EdgeInsets(top: 10,
                                                leading: 12,
                                                bottom: 10,
                                                trailing: 12))
                            CityAndDateView(city: viewModel.fullEnitity.destName,
                                            code: viewModel.fullEnitity.destIata,
                                            time: viewModel.searchResult.arrTime,
                                            date: viewModel.searchResult.arrDate)
                            .padding(EdgeInsets(top: 10,
                                                leading: 12,
                                                bottom: 10,
                                                trailing: 12))
                            
                        }
                        .background(AppColors.rowColor)
                        .cornerRadius(14)
                        Spacer()
                        
                    }
                    .padding(EdgeInsets(top: 10,
                                        leading: 0,
                                        bottom: 0,
                                        trailing: 0))
                    
                    Button(viewModel.searchResult.buttonTitle) {
                        presentAlert = true
                    }.alert(isPresented: $presentAlert) {
                        Alert(title: Text(viewModel.searchResult.buyAlertTitle),
                              dismissButton: .cancel(Text("Отлично")))
                    }
                    .font(.system(size: 17, weight: .bold))
                    .buttonStyle(OrangeButtonStyle())
                    .background(AppColors.orangeBtn)
                    .cornerRadius(12)
                    .padding(EdgeInsets(top: 0,
                                        leading: 0,
                                        bottom: 10,
                                        trailing: 0))
                    Spacer()
                }
                .padding(EdgeInsets(top: 10,
                                    leading: 16,
                                    bottom: 0,
                                    trailing: 16))
            }
            .background(AppColors.mainBackgroundColor)
        }
    }
}

struct OrangeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: 48, alignment: .center)
            .contentShape(Rectangle())
            .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: PreviewDetailsViewModel())
    }
}

