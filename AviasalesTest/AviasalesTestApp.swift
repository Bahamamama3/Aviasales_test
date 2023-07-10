//
//  AviasalesTestApp.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 8/7/23.
//

import SwiftUI

@main
struct AviasalesTestApp: App {
    var body: some Scene {
        WindowGroup {
            let testOrigin = "MOW"
            let testDestination = "LED"
            let service: SearchServiceInterface = SearchService()
            let viewModel = MainViewModel(service: service, origin: testOrigin, destination: testDestination)
            MainView(viewModel: viewModel)
        }
    }
}
