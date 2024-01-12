//
//  Endpoint.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation

protocol Endpoint {
    /// Scheme of the URL, e.g. https
    var scheme: String { get }

    /// Host of the API, e.g. api.openweathermap.org
    var host: String { get }

    /// Endpoint path
    var path: String { get }

    /// Array of query items to be passed into the request
    var queryItems: [URLQueryItem]? { get }
}
