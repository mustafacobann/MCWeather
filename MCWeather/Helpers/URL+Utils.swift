//
//  URL+Utils.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation

extension URL {
    /// Returns the appropriate URL for the given weather icon name
    /// - Parameter iconName: Icon name for the current weather
    /// - Returns: Appropriate URL for the given weather icon name
    static func weatherIconURL(for iconName: String) -> URL? {
        URL(string: "https://openweathermap.org/img/wn/\(iconName)@2x.png")
    }
}
