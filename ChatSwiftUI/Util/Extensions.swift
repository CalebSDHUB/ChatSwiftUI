//
//  Extension.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 28/02/2022.
//

//import UIKit
import SwiftUI
import Firebase

/// Adding extra colors to the Color Type
extension Color {
    static let darkGray = Color(#colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1))
}

/// Exists keyboard
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
/// Check if the current user exists: Bool
extension Auth {
    struct Custom {
        // Returns bool if or not the current user exist
        static func isCurrentUser() -> Bool {
            auth().currentUser != nil ? true : false
        }
    }
}
