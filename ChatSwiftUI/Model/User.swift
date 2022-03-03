//
//  User.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 03/03/2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let fullname: String
    let email: String
    let profileImgeUrl: String
}
