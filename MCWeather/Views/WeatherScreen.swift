//
//  WeatherScreen.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import SwiftUI

struct WeatherScreen: View {
    /// View model that contains weather information
    @StateObject var weatherViewModel: WeatherViewModel

    /// A flag that determines whether map screen is shown
    @State var isMapScreenShown = false

    /// Size of the weather icon
    let weatherIconSize: CGFloat = 120

    init(weatherService: WeatherServiceRequestable) {
        let weatherViewModel = WeatherViewModel(weatherService: weatherService)
        _weatherViewModel = StateObject(wrappedValue: weatherViewModel)
    }

    var body: some View {
        if let iconURL = weatherViewModel.weatherIconURL,
           let weatherGroup = weatherViewModel.weatherGroup,
           let weatherDescription = weatherViewModel.weatherDescription {
            VStack {
                Spacer()
                WeatherIconView(iconURL: iconURL, size: weatherIconSize)
                Text("\(weatherGroup)")
                    .font(.title.bold())
                Text("\(weatherDescription)")
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .safeAreaInset(edge: .bottom) {
                LocationView(
                    latitude: weatherViewModel.selectedLatitude,
                    longitude: weatherViewModel.selectedLongitude
                )
                .padding()
            }
            .overlay(alignment: .topTrailing) {
                LocationButton {
                    isMapScreenShown = true
                }
            }
            .sheet(isPresented: $isMapScreenShown) {
                MapScreen(
                    selectedLatitude: weatherViewModel.selectedLatitude,
                    selectedLongitude: weatherViewModel.selectedLongitude
                ) { latitude, longitude in
                    weatherViewModel.selectedLatitude = latitude
                    weatherViewModel.selectedLongitude = longitude
                }
            }
        } else {
            ProgressView()
        }
    }
}

#Preview {
    WeatherScreen(
        weatherService: MockWeatherService()
    )
}
