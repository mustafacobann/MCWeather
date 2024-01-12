//
//  WeatherServiceError.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation

/// Weather service error enumerations
enum WeatherServiceError: Error, CustomStringConvertible {
    /// Occurs when the URL format is invalid
    case invalidURL

    /// String descriptions of error cases
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL Error"
        }
    }
}
