//
//  SettingsView.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct SettingsView: View {
    
    //MARK: - Properties
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Settings")
        }
    }
}

//MARK: - Preview
#Preview {
    SettingsView()
}
