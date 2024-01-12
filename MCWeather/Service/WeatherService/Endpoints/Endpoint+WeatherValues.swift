//
//  Endpoint+WeatherValues.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation

extension Endpoint {
    var scheme: String { "https" }
    var host: String { "api.openweathermap.org" }
    var basePath: String { "/data/2.5" }

    /// URL for the endpoint
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = basePath.appending(path)
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
}
