//
//  LoginView.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 28/02/2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    
                    HStack { Spacer() }
                    
                    Text("Hello.")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                    
                    VStack(spacing: 40) {
                        CustomTextField(text: $email, imageName: "envelope", placeholderText: "Email", isSecureField: false)
                        
                        CustomTextField(text: $password, imageName: "lock", placeholderText: "Password", isSecureField: true)
                    }
                    .padding([.top, .horizontal], 32)
                    

                }
                .padding(.leading)
                .navigationBarHidden(true)
                
                HStack {
                    Spacer()
                    NavigationLink(
                        destination: Text("Reset password..."),
                        label: {
                            Text("Forgot Password")
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.top)
                                .padding(.trailing, 28)
                        })
                }
                
                Button(action: {
                    print("Handle sign up...")
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                
                Spacer()
                
                HStack {
                    
                    NavigationLink(
                        destination: RegistrationView()
                            .navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                    })
                        .padding(.bottom, 16)
                }
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
