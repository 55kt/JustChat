//
//  ContentView.swift
//  JustChat
//
//  Created by Vlad on 28/6/24.
//

import SwiftUI

struct ContentView: View {

    //MARK: - Body
    var body: some View {
        NavigationStack {
            MainTabView()
                .background(Background().ignoresSafeArea())
        }
    }
}

//MARK: - Preview
#Preview {
    ContentView()
}
