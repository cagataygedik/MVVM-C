//
//  MockNetworkService.swift
//  MVVM-CTests
//
//  Created by Celil Çağatay Gedik on 16.08.2024.
//

import Foundation
@testable import MVVM_C

class MockNetworkService: NetworkServiceProtocol {
    var result: Result<[Airport], Error>?
    
    func request<T>(endpoint: MVVM_C.APIEndpoint, completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        guard let result = result as? Result<T, Error> else {
            return
        }
        completion(result)
    }
}
