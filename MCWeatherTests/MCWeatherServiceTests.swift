//
//  MCWeatherServiceTests.swift
//  MCWeatherTests
//
//  Created by Mustafa on 12.01.2024.
//

import XCTest
import Combine
@testable import MCWeather

final class MCWeatherServiceTests: XCTestCase {
    /// Set of cancellables that contains combine publishers
    var cancellables = Set<AnyCancellable>()

    /// Constants used during the testing
    enum Constants {
        static let timeout: TimeInterval = 10
        static let latitude: Double = .mockLatitude
        static let longitude: Double = .mockLongitude
    }

    /// Tests whether getWeather fetches the weather correctly
    func testGetWeatherFetchesCorrectly() throws {
        let weatherService = WeatherService()
        let getWeatherExpectation = expectation(description: "getWeather")

        weatherService.getWeather(
            latitude: Constants.latitude,
            longitude: Constants.longitude
        )
        .sink(
            receiveCompletion: { completion in
                if case .failure = completion {
                    XCTFail()
                }
            },
            receiveValue: { weather in
                XCTAssertNotNil(weather)
                getWeatherExpectation.fulfill()
            }
        )
        .store(in: &cancellables)

        wait(for: [getWeatherExpectation], timeout: Constants.timeout)
    }
}
