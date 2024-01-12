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
    
    var cancellables = Set<AnyCancellable>()
    
    enum Constants {
        static let timeout: TimeInterval = 10
    }

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
