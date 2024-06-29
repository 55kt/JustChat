//
//  Background.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .blur(radius: 20)
                        .ignoresSafeArea()
    }
}

#Preview {
    Background()
}
