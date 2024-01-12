//
//  LocationButton.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import SwiftUI

struct LocationButton: View {
    /// Action that is triggered when the button is pressed
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Image(systemName: "location")
                .font(.title2)
        }
        .padding(20)
    }
}

#Preview {
    LocationButton {}
}
