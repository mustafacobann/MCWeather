//
//  WeatherServiceRequestable.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation
import Combine

protocol WeatherServiceRequestable {
    /// Returns a publisher that contains the weather for the pre-determined location
    func getWeather() -> AnyPublisher<Weather, Error>
}
