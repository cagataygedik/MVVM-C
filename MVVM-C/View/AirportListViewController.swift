//
//  ViewController.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 14.08.2024.
//

import UIKit
import SnapKit

class AirportListViewController: UIViewController {
    private let viewModel: AirportListViewModel
    private let coordinator: AirportListCoordinator
    private let tableView = UITableView()
    
    init(viewModel: AirportListViewModel, coordinator: AirportListCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupUI()
        bindViewModel()
    }
    
    private func setupViewController() {
        view.backgroundColor = .white
        title = "Airports"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        viewModel.updateUI = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.fetchAirports()
    }
}

extension AirportListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let airport = viewModel.airports[indexPath.row]
        cell.textLabel?.text = "\(airport.code) - \(airport.city)"
        return cell
    }
}

extension AirportListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let airport = viewModel.getAirport(at: indexPath.row)
        coordinator.showAirportDetail(airportName: airport.name)
    }
}


