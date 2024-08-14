//
//  AirportViewModel.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 14.08.2024.
//

import Foundation

class AirportViewModel {
    private let networkService: NetworkServiceProtocol
    private weak var coordinator: AppCoordinator?
    
    var airports: [Airport] = []
    var updateUI: (() -> Void)?
    
    init(networkService: NetworkServiceProtocol, coordinator: AppCoordinator) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    func fetchAirports() {
        networkService.fetchAirports { [weak self] result in
            switch result {
            case .success(let airports):
                self?.airports = airports
                self?.updateUI?()
            case .failure(let error):
                print("Error fetching airports: \(error)")
            }
        }
    }
    
    func getAirport(at index: Int) -> Airport {
        return airports[index]
    }
    
    func didSelectAirport(at index: Int) {
        let airport = getAirport(at: index)
        coordinator?.showAirportDetail(airportName: airport.name)
    }
}

