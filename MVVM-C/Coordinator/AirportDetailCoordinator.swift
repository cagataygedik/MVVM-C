//
//  AirportDetailCoordinator.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 15.08.2024.
//

import UIKit

class AirportDetailCoordinator {
    private let navigationController: UINavigationController
    private let airportName: String
    
    init(navigationController: UINavigationController, airportName: String) {
        self.navigationController = navigationController
        self.airportName = airportName
    }
    
    func start() {
        let viewModel = AirportDetailViewModel(airportName: airportName)
        let detailViewController = AirportDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
