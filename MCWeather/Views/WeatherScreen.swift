//
//  WeatherScreen.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import SwiftUI

struct WeatherScreen: View {
    @StateObject var weatherViewModel: WeatherViewModel
    let imageSize: CGFloat = 120
    let imageOpacity: CGFloat = 0.2

    init(weatherService: WeatherServiceRequestable) {
        let weatherViewModel = WeatherViewModel(weatherService: weatherService)
        _weatherViewModel = StateObject(wrappedValue: weatherViewModel)
    }

    var body: some View {
        VStack {
            if let iconURL = weatherViewModel.weatherIconURL {
                AsyncImage(
                    url: iconURL,
                    content: { image in
                        image
                            .resizable()
                            .frame(width: imageSize, height: imageSize)
                    },
                    placeholder: {
                        Color.gray
                            .opacity(imageOpacity)
                            .frame(width: imageSize, height: imageSize)
                    }
                )
            }

            if let weatherGroup = weatherViewModel.weatherGroup {
                Text("\(weatherGroup)")
                    .font(.title.bold())
            }

            if let weatherDescription = weatherViewModel.weatherDescription {
                Text("\(weatherDescription)")
            }

            
        }
        .padding()
    }
}

#Preview {
    WeatherScreen(
        weatherService: MockWeatherService()
    )
}
