//
//  CustomButton.swift
//  JustChat
//
//  Created by Vlad on 29/6/24.
//

import SwiftUI

struct customButton: View {
    
    //MARK: - Properties
    var action: () -> ()
    var buttonName: String
    
    //MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonName)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

//MARK: - Preview
#Preview {
    customButton(action: {}, buttonName: "Button")
}
