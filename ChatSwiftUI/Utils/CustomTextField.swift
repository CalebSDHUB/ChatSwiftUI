//
//  CustomTextField.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 28/02/2022.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    let imageName: String
    let placeholderText: String
    let isSecureField: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height:20)
                    .foregroundColor(Color.darkGray)
                
                if isSecureField {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                }
            }
            Divider()
                .background(Color.darkGray)
        }
    }
}
