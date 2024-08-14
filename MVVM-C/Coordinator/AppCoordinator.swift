//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 14.08.2024.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let networkService = NetworkService()
        let viewModel = AirportViewModel(networkService: networkService, coordinator: self)
        let airportViewController = AirportViewController(viewModel: viewModel)
        
        navigationController.setViewControllers([airportViewController], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showAirportDetail(airportName: String) {
        let detailViewModel = AirportDetailViewModel(airportName: airportName)
        let detailViewController = AirportDetailViewController(viewModel: detailViewModel)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}

