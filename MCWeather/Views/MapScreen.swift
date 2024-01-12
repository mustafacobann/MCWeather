//
//  MapScreen.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var mapPosition: MapCameraPosition
    @State private var selectedLocation: CLLocationCoordinate2D

    let onSelectLocation: (Double, Double) -> Void

    init(
        selectedLatitude: Double,
        selectedLongitude: Double,
        onSelecLocation: @escaping (Double, Double) -> Void
    ) {
        let selectedLocation = CLLocationCoordinate2D(
            latitude: selectedLatitude,
            longitude: selectedLongitude
        )
        _selectedLocation = State(initialValue: selectedLocation)
        _mapPosition = State(
            initialValue: MapCameraPosition.camera(
                MapCamera(
                    centerCoordinate: selectedLocation,
                    distance: 1000
                )
            )
        )
        self.onSelectLocation = onSelecLocation
    }

    var body: some View {
        ZStack {
            MapReader { reader in
                Map(initialPosition: mapPosition) {
                    Marker(String.Map.selectedLocation, coordinate: selectedLocation)
                }
                .onTapGesture(coordinateSpace: .local) { coordinate in
                    if let coordinate = reader.convert(coordinate, from: .local) {
                        selectedLocation = coordinate
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea()
            .safeAreaInset(edge: .bottom) {
                VStack {                    
                    LocationView(
                        latitude: selectedLocation.latitude,
                        longitude: selectedLocation.longitude
                    )
                    
                    BottomButton(title: .Map.select) {
                        onSelectLocation(selectedLocation.latitude, selectedLocation.longitude)
                        dismiss()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.background)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MapScreen(selectedLatitude: .mockLatitude, selectedLongitude: .mockLongitude) { _,_ in }
}
