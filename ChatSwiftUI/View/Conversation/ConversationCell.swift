//
//  UserCell.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 01/03/2022.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack {
                // image
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                // message info
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Caleb Danielsen")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("This is some test messages for now...")
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
            .previewLayout(.sizeThatFits)
    }
}
