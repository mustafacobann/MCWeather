//
//  BottomButton.swift
//  MCWeather
//
//  Created by Mustafa on 12.01.2024.
//

import SwiftUI

struct BottomButton: View {
    /// Title of the button
    let title: String

    /// Action that is triggered when the button is tapped
    let onTap: () -> Void
    
    var body: some View {
        Button(
            action: onTap,
            label: {
                Text(verbatim: title)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                    )
                    .padding()
            }
        )
    }
}

#Preview {
    BottomButton(title: .Map.select) {}
}
