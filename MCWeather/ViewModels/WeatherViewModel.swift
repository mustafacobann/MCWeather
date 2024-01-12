//
//  WeatherViewModel.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    /// Weather instance that is retrieved from the API
    @Published var weather: Weather?

    /// Selected latitude value for which weather is retrieved
    ///
    /// Default value: 52.364138
    var selectedLatitude: Double = .mockLatitude

    /// Selected longitude value for which weather is retrieved
    ///
    /// Default value: 4.891697
    var selectedLongitude: Double = .mockLongitude

    /// Temperature of the weather
    var temperature: String? {
        guard let temperatureValue = weather?.current.temp else { return nil }
        return "\(Int(temperatureValue)) °C"
    }

    /// Weather group name, e.g. "Snow"
    var weatherGroup: String? {
        weather?.current.weather[0].main.capitalized
    }

    /// A detailed description of the weather, e.g. "light rain and snow"
    var weatherDescription: String? {
        weather?.current.weather[0].description.capitalized
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

    func fetchWeatherInfo() {
        weatherService.getWeather(
            latitude: selectedLatitude,
            longitude: selectedLongitude
        )
        .sink(
            receiveCompletion: { completion in
                if case .failure(let failure) = completion {
                    debugPrint("fetchWeatherInfo finished with error: \(failure.localizedDescription)")
                }
            },
            receiveValue: { [weak self] weather in
                self?.weather = weather
            }
        )
        .store(in: &cancellables)
    }
}
