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
        view.backgroundColor = .white
        title = "Airport Detail"
        setupUI()
    }
    
    private func setupUI() {
        airportNameLabel.text = viewModel.airportName
        airportNameLabel.textAlignment = .center
        airportNameLabel.font = UIFont.systemFont(ofSize: 24)
        
        view.addSubview(airportNameLabel)
        
        airportNameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
