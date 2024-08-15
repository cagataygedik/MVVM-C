//
//  AirportViewModel.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 14.08.2024.
//

import Foundation

class AirportViewModel {
    private let networkService: NetworkServiceProtocol
    
    var airports: [Airport] = []
    var updateUI: (() -> Void)?
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchAirports() {
        networkService.request(endpoint: .airports) { [weak self] (result: Result<[Airport], Error>) in
            switch result {
            case .success(let airports):
                self?.airports = airports
                self?.updateUI?()
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func getAirport(at index: Int) -> Airport {
        return airports[index]
    }
}

