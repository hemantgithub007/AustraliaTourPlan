//
//  AustraliaTourPlanTests.swift
//  AustraliaTourPlanTests
//
//  Created by TDE Mackbook on 24/01/25.
//


//Unit tests for CityViewModel will focus on testing its methods and state changes.

//Example: Testing refreshData and loadFromCache:

/*
import XCTest
@testable import AustraliaTourPlan // Replace with your app's module name

final class CityViewModelTests: XCTestCase {
    var viewModel: CityViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CityViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testRefreshData() {
        // Ensure the view model starts with an empty list
        XCTAssertTrue(viewModel.cities.isEmpty, "Cities array should be empty initially")

        // Call refreshData
        viewModel.refreshData()

        // Wait for data to load
        let expectation = XCTestExpectation(description: "Data refreshed")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertFalse(self.viewModel.cities.isEmpty, "Cities array should not be empty after refresh")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testLoadFromCache() {
        // Cache mock data
        let mockCities = [
            City(city: "Sydney", lat: "-33.8688", lng: "151.2093", country: "Australia", admin_name: "NSW", population: "5312163"),
            City(city: "Melbourne", lat: "-37.8136", lng: "144.9631", country: "Australia", admin_name: "VIC", population: "5078193")
        ]
        viewModel.cacheData(mockCities)

        // Clear cities and load from cache
        viewModel.cities = []
        viewModel.loadFromCache()

        // Assert cities were loaded from cache
        XCTAssertEqual(viewModel.cities.count, mockCities.count, "Cities loaded from cache should match cached data")
    }
}
*/
