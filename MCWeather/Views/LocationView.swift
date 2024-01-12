//
//  LocationView.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import SwiftUI

struct LocationView: View {
    /// Latitude of the weather location
    let latitude: Double

    /// Longitude of the requested weather location
    let longitude: Double

    var body: some View {
        VStack {
            Text(verbatim: .Map.selectedLocation)
                .font(.title3.bold())
                .padding(.bottom, 4)
            
            Group {
                HStack {
                    Text(verbatim: .Map.latitude)
                    Text("\(latitude)")
                }
                
                HStack {
                    Text(verbatim: .Map.longitude)
                    Text("\(longitude)")
                }
            }
            .font(.callout)
        }
    }
}

#Preview {
    LocationView(latitude: .mockLatitude, longitude: .mockLongitude)
}
