//
//  AirportListViewModelTests.swift
//  MVVM-CTests
//
//  Created by Celil Çağatay Gedik on 16.08.2024.
//

import XCTest
@testable import MVVM_C

final class AirportListViewModelTests: XCTestCase {
    var sut: AirportListViewModel!
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        sut = AirportListViewModel(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func testFetchAirportsSuccess() {
        let mockAirports = [Airport(name: "John F. Kennedy International Airport", code: "JFK", city: "New York"),
                            Airport(name: "Istanbul Airport", code: "IST", city: "Istanbul")
        ]
        mockNetworkService.result = .success(mockAirports)
        
        let expectation = XCTestExpectation(description: "updateUI closure called")
        sut.updateUI = {
            expectation.fulfill()
        }
        
        sut.fetchAirports()
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(sut.airports.count, 2)
        XCTAssertEqual(sut.airports.first?.code, "JFK")
        XCTAssertEqual(sut.airports.first?.city, "New York")
    }
    
    func testFetchAirportFailure() {
        mockNetworkService.result = .failure(NSError(domain: "Network Error", code: -1, userInfo: nil))
        
        let expectation = XCTestExpectation(description: "updateUI closure can not called")
        expectation.isInverted = true
        sut.updateUI = {
            expectation.fulfill()
        }
        
        sut.fetchAirports()
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(sut.airports.isEmpty)
    }
}
