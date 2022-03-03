//
//  RegistrationView.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 28/02/2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @Environment(\.presentationMode) var mode
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            NavigationLink(
                destination: ProfilePhotoSelectorView(),
                isActive: $viewModel.didAuthenticateUser,
                label: {})
            
            VStack(alignment: .leading, spacing: 20) {
                
                HStack { Spacer() }
                
                Text("Get Started.")
                    .font(.largeTitle)
                    .bold()
                
                Text("Create your account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 40) {
                    CustomTextField(text: $email, imageName: "envelope", placeholderText: "Email", isSecureField: false)
                    
                    CustomTextField(text: $username, imageName: "person", placeholderText: "Username", isSecureField: false)
                    
                    CustomTextField(text: $fullname, imageName: "person", placeholderText: "Fullname", isSecureField: false)
                    
                    CustomTextField(text: $password, imageName: "lock", placeholderText: "Password", isSecureField: true)
                }
                .padding([.top, .horizontal], 32)
            }
            .padding(.leading)
            
            Button(action: {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            }, label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            })
            .padding(.top, 24)
            .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
            
            Spacer()
            
            Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
            })
            .padding(.bottom, 32)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
