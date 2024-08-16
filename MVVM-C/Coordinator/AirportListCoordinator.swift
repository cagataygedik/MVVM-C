//
//  AirportListCoordinator.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 15.08.2024.
//

import UIKit

class AirportListCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let networkService = NetworkService()
        let viewModel = AirportListViewModel(networkService: networkService)
        let airportListViewController = AirportListViewController(viewModel: viewModel, coordinator: self)
        navigationController.setViewControllers([airportListViewController], animated: false)
    }
    
    func showAirportDetail(airportName: String) {
        let airportDetailCoordinator = AirportDetailCoordinator(navigationController: navigationController, airportName: airportName)
        airportDetailCoordinator.start()
    }
}
