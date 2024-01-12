//
//  WeatherService.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation
import Combine

final class WeatherService: WeatherServiceRequestable {
    /// Decoder that is used to decoded the response of the service request
    let decoder = JSONDecoder()

    /// Returns 
    func getWeather(
        latitude: Double,
        longitude: Double
    ) -> AnyPublisher<Weather, Error> {
        let onecallEndpoint = OneCallEndpoint(
            latitude: latitude,
            longitude: longitude
        )

        return NetworkManager.fetch(
            endpoint: onecallEndpoint,
            decoder: decoder
        )
    }
}
