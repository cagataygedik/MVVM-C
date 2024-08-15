//
//  NetworkService.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 14.08.2024.
//

import Alamofire

protocol NetworkServiceProtocol {
    func request<T: Decodable>(endpoint: APIEndpoint, completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func request<T>(endpoint: APIEndpoint, completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        AF.request(endpoint.url).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

