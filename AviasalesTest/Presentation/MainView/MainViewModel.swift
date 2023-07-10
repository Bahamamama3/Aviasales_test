//
//  MainViewModel.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 8/7/23.
//

import Foundation
import SwiftUI

protocol MainViewModelInterface: ObservableObject {
    var state: MainViewModel.State { set get }
    func getData()
}

final class MainViewModel: MainViewModelInterface {
    
    enum State {
        case idle
        case loading
        case error(Error)
        case success(SearchEnitity)
    }
    
    private let service: SearchServiceInterface
    
    @Published var state: State = .idle
    
    private let origin: String
    private let destination: String
    
    init(service: SearchServiceInterface, origin: String, destination: String) {
        self.service = service
        self.origin = origin
        self.destination = destination
    }
    
    func getData() {
        state = .loading
        Task(priority: .high) {
            let result = await service.getSearchData(origin: origin,
                                                     destination: destination)
            await sortAndShow(result)
        }
    }
    
    @MainActor func sortAndShow(_ result: Result<SearchEnitity, RequestError>) {
        switch result {
        case .success(var data):
            let results = data.result
            var sortedResults = results.sorted { $0.price < $1.price }
            if !sortedResults.isEmpty {
                sortedResults[0].setAsCheapest()
            }
            data.result = sortedResults
            state = .success(data)
        case .failure(let failure):
            state = .error(failure)
        }
    }
}

final class MainViewModelPreview: MainViewModelInterface {
    var state: MainViewModel.State = .idle
    func getData() { }
}
