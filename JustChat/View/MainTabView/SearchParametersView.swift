//
//  SearchParametersView.swift
//  JustChat
//
//  Created by Vlad on 3/7/24.
//

import SwiftUI

struct SearchParametersView: View {
    
    //MARK: - Properties
    @Binding var selectedTags: [String]
    @Binding var age: Int?
    @Binding var gender: String
    @Binding var country: String
    @Binding var language: String
    @Binding var showingSearchParameters: Bool
    
    @State private var tagInput: String = ""
    @State private var avaliableTags = ["swift", "ios", "developer", "chat", "code", "programming", "mobile", "app"]
    
    var filteredTags: [String] {
        avaliableTags.filter { tag in
            !selectedTags.contains(tag) && tag.lowercased().contains(tagInput.lowercased())
        }
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            // Fields
            VStack(spacing: 20) {
                TextField("Age", value: $age, formatter: NumberFormatter())
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                TextField("Gender", text: $gender)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                TextField("Country", text: $country)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                TextField("Language", text: $language)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                VStack(alignment: .leading) {
                    TextField("Add Tag", text: $tagInput)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    // Tags Optionality
                    if !filteredTags.isEmpty {
                        List(filteredTags, id: \.self) { tag in
                                Text(tag)
                                .onTapGesture {
                                    selectedTags.append(tag)
                                    tagInput = ""
                                }
                        }
                        .frame(height: 150)
                    }
                }
                
                TagSelectionView(selectedTags: $selectedTags)
                
                Button(action: {
                    showingSearchParameters = false
                }) {
                    Text("Done")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Search Parameters", displayMode: .inline)
        }
    }
}

#Preview {
    SearchParametersView(selectedTags: .constant(["swift", "ios", "user", "USA", "Love"]), age: .constant(25), gender: .constant("male"), country: .constant("USA"), language: .constant("English"), showingSearchParameters: .constant(true))
}
