//
//  MCWeatherApp.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import SwiftUI

@main
struct MCWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherScreen(
                weatherService: WeatherService()
            )
        }
    }
}
