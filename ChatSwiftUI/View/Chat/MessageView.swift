//
//  MessageView.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 01/03/2022.
//

import SwiftUI

struct MessageView: View {
    
    var isFromCurrentUser: Bool
    var messageText: String
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                
                Text(messageText)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal, 30)
                
            } else {
                HStack(alignment: .bottom) {
                    Image("dog1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    Text(messageText)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 30)
                .padding(.trailing, 80)
                
                Spacer()
            }
        }
    }
}
