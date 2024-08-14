//
//  NetworkService.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 14.08.2024.
//

import Alamofire

protocol NetworkServiceProtocol {
    func fetchAirports(completion: @escaping (Result<[Airport], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func fetchAirports(completion: @escaping (Result<[Airport], Error>) -> Void) {
        let url = "https://freetestapi.com/api/v1/airports"
        
        AF.request(url).responseDecodable(of: [Airport].self) { response in
            switch response.result {
            case .success(let airports):
                completion(.success(airports))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

