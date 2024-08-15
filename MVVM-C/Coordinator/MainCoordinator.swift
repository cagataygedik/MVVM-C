//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 14.08.2024.
//

import UIKit

class MainCoordinator {
    private let window: UIWindow
    private let navigationController: UINavigationController
    private var airportListCoordinator: AirportListCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        airportListCoordinator = AirportListCoordinator(navigationController: navigationController)
        airportListCoordinator?.start()
    }
}

