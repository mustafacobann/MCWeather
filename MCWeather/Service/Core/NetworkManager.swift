//
//  NetworkManager.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation
import Combine

/// A manager class to fetch data from endpoints
final class NetworkManager {
    private init() {}

    /// A generic function to fetch data from an endpoint
    /// - Parameter endpoint: The endpoint to which a fetch request is sent
    /// - Returns: A publisher that emits the response value
    static func fetch<ResponseType: Decodable>(
        endpoint: Endpoint,
        decoder: JSONDecoder
    ) -> AnyPublisher<ResponseType, Error> {
        guard let url = endpoint.url
        else {
            return Fail(error: WeatherServiceError.invalidURL).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ResponseType.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
