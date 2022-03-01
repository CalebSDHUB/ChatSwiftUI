//
//  ChatViewModel.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 01/03/2022.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    
    init() {
        messages = mockMessages
    }
    
    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "Hey what's up man"),
            .init(isFromCurrentUser: false, messageText: "Not much, how are you"),
            .init(isFromCurrentUser: true, messageText: "I'm doing file. Having fun building this app"),
            .init(isFromCurrentUser: true, messageText: "Are you learning a lot?"),
            .init(isFromCurrentUser: false, messageText: "Yeah I am. I love this course"),
            .init(isFromCurrentUser: true, messageText: "That's awesome, im glad I bought it"),
            .init(isFromCurrentUser: true, messageText: "Talk to you later!"),
            
        ]
    }
    
    func sendMessage(_ messageText: String) {
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
}
