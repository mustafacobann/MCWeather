//
//  MockWeatherService.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation
import Combine

class MockWeatherService: WeatherServiceRequestable {
    /// A mock weather instance provided to the mock weather service for testing purposes
    private let mockWeather: Weather

    /// A weather instance used to show information in SwiftUI previews
    let previewWeather = Weather(
        lat: .mockLatitude,
        lon: .mockLongitude,
        current: Weather.CurrentWeather(
            temp: 34.5,
            weather: [
                Weather.WeatherDetail(
                    main: .MockServiceData.rain,
                    description: .MockServiceData.veryHeavyRain,
                    icon: .MockServiceData.iconName
                )
            ]
        )
    )

    init(mockWeather: Weather? = nil) {
        self.mockWeather = mockWeather ?? previewWeather
    }

    /// Returns a publisher that contains the weather for the pre-determined location
    func getWeather(
        latitude: Double,
        longitude: Double
    ) -> AnyPublisher<Weather, Error> {
        Just(mockWeather)
            .tryMap { $0 }
            .eraseToAnyPublisher()
    }
}
