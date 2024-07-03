//
//  GoChatView.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct GoChatView: View {
    
    //MARK: - Properties
        @State private var selectedTags: [String] = []
        @State private var age: Int = 0
        @State private var gender: String = ""
        @State private var country: String = ""
        @State private var language: String = ""
        @State private var searchResult: User? = nil
        @State private var showingChatView = false
        @State private var showingSearchParameters = false
    
    //MARK: - Body
    var body: some View {
        VStack {
            customNavBar(navTiltle: "GoChat")
            
            VStack(spacing: 20) {
                Button {
                    showingSearchParameters = true
                } label: {
                    Image(systemName: "slider.vertical.3")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .sheet(isPresented: $showingSearchParameters) {
                    SearchParametersView(selectedTags: $selectedTags, age: .constant(25), gender: $gender, country: $country, language: $language, showingSearchParameters: $showingSearchParameters)
                }
                
                Button {
                    // some action
                } label: {
                    VStack {
                        Text("Go")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text("Chat")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .clipShape(Circle())
                }
            }
        }
    }
}

//MARK: - Preview
#Preview {
    GoChatView()
}
