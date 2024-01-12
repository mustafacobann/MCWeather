//
//  WeatherViewModel.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?

    /// Weather group name, e.g. "Snow"
    var weatherGroup: String? {
        weather?.current.weather[0].main
    }

    /// A detailed description of the weather, e.g. "light rain and snow"
    var weatherDescription: String? {
        weather?.current.weather[0].description
    }

    /// URL for the current weather icon
    var weatherIconURL: URL? {
        guard let iconName = weather?.current.weather[0].icon,
              let iconURL = URL.weatherIconURL(for: iconName)
        else { return nil }

        return iconURL
    }

    /// Weather service used to fetch the weather information
    private var weatherService: WeatherServiceRequestable

    /// Set of cancellables that contains combine publishers
    private var cancellables: Set<AnyCancellable>

    init(weatherService: WeatherServiceRequestable) {
        self.weather = nil
        self.weatherService = weatherService
        self.cancellables = Set<AnyCancellable>()
        fetchWeatherInfo()
    }

    private func fetchWeatherInfo() {
        weatherService.getWeather()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] weather in
                    self?.weather = weather
                }
            )
            .store(in: &cancellables)
    }
}
