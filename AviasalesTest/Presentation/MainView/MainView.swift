//
//  MainView.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 8/7/23.
//

import SwiftUI

struct MainView<ViewModel: MainViewModelInterface>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .error:
                ErrorView {
                    viewModel.getData()
                }
            case .success(let model):
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(model.result) { data in
                            Row(fullEntity: model, searchResultEntity: data)
                        }
                    }
                    .padding(EdgeInsets(top: 26, leading: 0, bottom: 0, trailing: 0))
                }
                .background(AppColors.mainBackgroundColor)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        LazyVStack {
                            Text(model.flightText)
                                .font(.system(size: 16, weight: .bold))
                            Text(model.flightDescr)
                                .font(.system(size: 12, weight: .light))
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.getData()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModelPreview())
    }
}
