//
//  UserCell.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 01/03/2022.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack {
                // image
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                // message info
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Caleb Danielsen")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Martin Smith")
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
