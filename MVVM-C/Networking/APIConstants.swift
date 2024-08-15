//
//  URL.swift
//  MVVM-C
//
//  Created by Celil Çağatay Gedik on 15.08.2024.
//

import Foundation

enum APIConstants {
    static let baseURL = "https://freetestapi.com/api/v1"
}

enum APIEndpoint: String {
    case airports = "/airports"
    
    var url: String {
        return "\(APIConstants.baseURL)\(self.rawValue)"
    }
}
