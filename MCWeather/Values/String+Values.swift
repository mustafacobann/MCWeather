//
//  String+Values.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation

extension String {
    /// An enum that contains string values used in mock data for preview and testing purposes
    enum MockServiceData {
        static let rain = "Rain"
        static let veryHeavyRain = "very heavy rain"
        static let iconName = "10d"
    }

    /// An enum that contains map related strings
    enum Map {
        static let selectedLocation = "Selected Location"
        static let select = "Select"
        static let latitude = "Latitude"
        static let longitude = "Longitude"
    }
}
