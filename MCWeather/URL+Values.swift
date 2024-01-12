//
//  URL+Values.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation

extension URL {
    /// Once call endpoint url for open weather api
    static var weatherURL: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        let basePath = "/data/2.5"
        urlComponents.path = basePath.appending("/onecall")
        urlComponents.queryItems = [
            URLQueryItem(name: QueryItemName.lat.rawValue, value: 52.364138.description),
            URLQueryItem(name: QueryItemName.lon.rawValue, value: 4.891697.description),
            URLQueryItem(name: QueryItemName.appid.rawValue, value: Secrets.apiKey),
        ]
        return urlComponents.url
    }

    /// URL Query Item Enumerations
    enum QueryItemName: String {
        /// Latitude of the weather location
        case lat

        /// Longitude of the weather location
        case lon

        /// API key
        case appid
    }
}
