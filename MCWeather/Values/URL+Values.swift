//
//  URL+Values.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import Foundation

extension URL {
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
