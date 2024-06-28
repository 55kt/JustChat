//
//  ContentView.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State private var isLoginView = true
    
    //MARK: - Body
    var body: some View {
        
        // Navigate in start pages
        VStack {
            if isLoginView {
                LoginView(isLoginView: $isLoginView)
            } else {
                CreateAccountView(isLoginView: $isLoginView)
            }
        }
    }
}

//MARK: - Preview
#Preview {
    ContentView()
}
