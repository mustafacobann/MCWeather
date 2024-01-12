//
//  MCWeatherViewModelTests.swift
//  MCWeatherTests
//
//  Created by Mustafa on 12.01.2024.
//

import XCTest
import Combine
@testable import MCWeather

final class MCWeatherViewModelTests: XCTestCase {
    /// Mock weather service used for testing
    var mockWeatherService: MockWeatherService?

    /// Weather view model that receives a mock weather service and used for testing
    var weatherViewModel: WeatherViewModel?

    /// Mock weather data
    let mockData = Weather(
        lat: .mockLatitude,
        lon: .mockLongitude,
        current: Weather.CurrentWeather(
            weather: [
                Weather.WeatherDetail(
                    main: .MockServiceData.rain,
                    description: .MockServiceData.veryHeavyRain,
                    icon: .MockServiceData.iconName
                )
            ]
        )
    )

    /// Set of cancellables that contains combine publishers
    var cancellables = Set<AnyCancellable>()

    /// Constants used during the testing
    enum Constants {
        static let timeout: TimeInterval = 10
    }

    override func setUpWithError() throws {
        mockWeatherService = MockWeatherService()
        if let mockWeatherService {
            weatherViewModel = WeatherViewModel(weatherService: mockWeatherService)
        }
    }

    override func tearDownWithError() throws {
        mockWeatherService = nil
        weatherViewModel = nil
    }

    /// Tests whether iconURL is constructed correctly
    func testIconURLCorrectness() throws {
        let iconName = mockData.current.weather[0].icon
        let correctIconURL = URL.weatherIconURL(for: iconName)
        
        let iconURLexpectation = expectation(description: "weatherIcon")
        
        weatherViewModel?.weather.publisher
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        XCTFail()
                    }
                },
                receiveValue: { [weak self] weather in
                    XCTAssertEqual(correctIconURL, self?.weatherViewModel!.weatherIconURL)
                    iconURLexpectation.fulfill()
                }
            )
            .store(in: &cancellables)
        
        wait(for: [iconURLexpectation], timeout: Constants.timeout)
    }
    
    /// Tests whether weather group name is displayed correctly
    func testWeatherGroupNameCorrectness() throws {
        let correctWeatherGroupName = mockData.current.weather[0].main.capitalized

        let groupNameExpectation = expectation(description: "groupNameExpectation")
        
        weatherViewModel?.weather.publisher
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        XCTFail()
                    }
                },
                receiveValue: { [weak self] weather in
                    XCTAssertEqual(correctWeatherGroupName, self?.weatherViewModel!.weatherGroup)
                    groupNameExpectation.fulfill()
                }
            )
            .store(in: &cancellables)
        
        wait(for: [groupNameExpectation], timeout: Constants.timeout)
    }
    
    /// Tests whether weather description is displayed correctly
    func testWeatherDescriptionCorrectness() throws {
        let correctWeatherDescription = mockData.current.weather[0].description.capitalized

        let descriptionExpectation = expectation(description: "descriptionExpectation")
        
        weatherViewModel?.weather.publisher
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        XCTFail()
                    }
                },
                receiveValue: { [weak self] weather in
                    XCTAssertEqual(correctWeatherDescription, self?.weatherViewModel!.weatherDescription)
                    descriptionExpectation.fulfill()
                }
            )
            .store(in: &cancellables)
        
        wait(for: [descriptionExpectation], timeout: Constants.timeout)
    }
}
