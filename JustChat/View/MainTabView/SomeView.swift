//
//  EmptyView.swift
//  JustChat
//
//  Created by Vlad on 30/6/24.
//

import SwiftUI

struct SomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Some View")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("EmptyView")
        }
    }
}

#Preview {
    SomeView()
}
