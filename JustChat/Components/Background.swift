//
//  Background.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                
                Color(UIColor { traitCollection in
                    traitCollection.userInterfaceStyle == .dark ? .white : .gray
                }),
                Color(UIColor { traitCollection in
                    traitCollection.userInterfaceStyle == .dark ? .black : .white
                }),
                Color(UIColor { traitCollection in
                    traitCollection.userInterfaceStyle == .dark ? UIColor.blue.withAlphaComponent(0.5) : UIColor.blue.withAlphaComponent(0.5)
                }),
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    Group {
        Background()
            .preferredColorScheme(.dark)
        
        Background()
            .preferredColorScheme(.light)
    }
}
