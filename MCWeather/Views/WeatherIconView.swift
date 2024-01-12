//
//  WeatherIconView.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import SwiftUI

// Icon view for the weather
struct WeatherIconView: View {
    /// URL of the weather icon
    let iconURL: URL?

    /// Size of the icon, both width and height is set to this value
    let size: CGFloat
    
    /// Opacity of the placeholder image
    let opacity: CGFloat = 0.2

    var body: some View {
        AsyncImage(
            url: iconURL,
            content: { image in
                image
                    .resizable()
                    .frame(width: size, height: size)
            },
            placeholder: {
                Color.gray
                    .opacity(opacity)
                    .clipShape(Circle())
                    .frame(width: size, height: size)
            }
        )
    }
}

#Preview {
    let mockWeatherService = MockWeatherService()
    let iconName = mockWeatherService.previewWeather.current.weather[0].icon

    return WeatherIconView(
        iconURL: URL.weatherIconURL(for: iconName),
        size: 120
    )
}
