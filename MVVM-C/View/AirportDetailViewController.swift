//
//  AirportDetailViewController.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 14.08.2024.
//

import UIKit

class AirportDetailViewController: UIViewController {
    private let airportNameLabel = UILabel()
    private let viewModel: AirportDetailViewModel
    
    init(viewModel: AirportDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupUI()
    }
    
    private func setupViewController() {
        view.backgroundColor = .white
        title = "Airport Detail"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupUI() {
        airportNameLabel.text = viewModel.airportName
        airportNameLabel.textAlignment = .center
        airportNameLabel.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(airportNameLabel)
        
        airportNameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
