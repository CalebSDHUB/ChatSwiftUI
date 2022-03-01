//
//  SettingHeaderView.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 01/03/2022.
//

import SwiftUI

struct SettingHeaderView: View {
    var body: some View {
        HStack {
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Caleb Danielsen")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                
                Text("Available")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}

struct SettingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SettingHeaderView()
    }
}
