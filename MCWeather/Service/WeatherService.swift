//
//  WeatherService.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation
import Combine

class WeatherService: WeatherServiceRequestable {
    /// URL for the weather service request
    let url: URL
    
    /// Decoder that is used to decoded the response of the service request
    let decoder: JSONDecoder
    
    init(url: URL) {
        self.url = url
        decoder = JSONDecoder()
    }
    
    /// Returns a publisher that contains the weather for the pre-determined location
    func getWeather() -> AnyPublisher<Weather, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Weather.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
