//
//  ChatView.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 01/03/2022.
//

import SwiftUI

struct ChatView: View {
    
    @State private var messageText = ""
    @ObservedObject var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            // messages
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
                    }
                }
            }
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle("Caleb")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    private func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
