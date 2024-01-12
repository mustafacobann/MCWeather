//
//  Weather.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation

/// A structure that contains weather information
struct Weather: Decodable {
    /// Latitude value of the weather location
    let lat: Double

    /// Longitude value of the weather location
    let lon: Double

    /// Current weather information
    let current: CurrentWeather

    /// A structure that contains current weather information
    struct CurrentWeather: Decodable {
        /// An array of weather details
        let weather: [WeatherDetail]
    }

    /// A structure that contains weather details such as weather title, icon name, etc.
    struct WeatherDetail: Decodable {
        /// Weather condition group name, e.g. "Snow"
        let main: String

        /// A detailed description of the weather, e.g. "light rain and snow"
        let description: String
        
        /// Icon name of the weather, e.g. "04n"
        let icon: String
    }
}
