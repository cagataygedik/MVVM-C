//
//  AirportDetailViewModelTests.swift
//  MVVM-CTests
//
//  Created by Celil Çağatay Gedik on 16.08.2024.
//

import XCTest
@testable import MVVM_C

final class AirportDetailViewModelTests: XCTestCase {
    
    func testAirportNameIsCorrect() {
        let expectedName = "Istanbul Airport"
        
        let viewModel = AirportDetailViewModel(airportName: expectedName)
        
        XCTAssertEqual(viewModel.airportName, expectedName)
    }
}
