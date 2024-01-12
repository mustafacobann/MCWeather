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
    }

    /// Tests whether getWeather fetches the weather correctly
    func testGetWeatherFetchesCorrectly() throws {
        guard let url = URL.weatherURL else {
            throw WeatherServiceError.invalidURL
        }

        let weatherService = WeatherService(url: url)
        let getWeatherExpectation = expectation(description: "getWeather")

        weatherService.getWeather()
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
