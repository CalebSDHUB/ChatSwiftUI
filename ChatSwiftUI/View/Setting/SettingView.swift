//
//  SettingView.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 01/03/2022.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                NavigationLink(
                    destination: EditProfileView(),
                    label: {
                        SettingHeaderView()
                    })
                
                VStack(spacing: 1) {
                    ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                        SettingsCell(viewModel: viewModel)
                    }
                }
                
                Button(action: {
                    authViewModel.signout()
                }, label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.white)
                })
                
                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
