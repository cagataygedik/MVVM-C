//
//  ViewController.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 14.08.2024.
//

import UIKit
import SnapKit

class AirportViewController: UIViewController {
    private let viewModel: AirportViewModel
    private let tableView = UITableView()
    
    init(viewModel: AirportViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindViewModel()
        
        viewModel.fetchAirports()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Airports"
        
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
    }
}

extension AirportViewController: UITableViewDataSource {
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

extension AirportViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectAirport(at: indexPath.row)
    }
}


