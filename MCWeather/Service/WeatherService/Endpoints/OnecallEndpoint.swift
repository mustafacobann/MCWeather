//
//  OnecallEndpoint.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation

/// Onecall endpoint url for open weather api
struct OneCallEndpoint: Endpoint {
    /// Latitude of the requested weather location
    let latitude: Double

    /// Latitude of the requested weather location
    let longitude: Double

    /// Path of the endpoint
    var path: String { "/onecall" }

    var queryItems: [URLQueryItem]? {
        [
            URLQueryItem(name: URL.QueryItemName.lat.rawValue, value: latitude.description),
            URLQueryItem(name: URL.QueryItemName.lon.rawValue, value: longitude.description),
            URLQueryItem(name: URL.QueryItemName.appid.rawValue, value: Secrets.apiKey)
        ]
    }
}
