//
//  LoginView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 20.11.23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    private let buttonWidth = UIScreen.main.bounds.width * 0.8
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(
                        colors: [.cyan, .indigo, .indigo, .purple]
                    ),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                    .ignoresSafeArea()
                
                VStack {
                    
                    // logo
                    Text("Communicator")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 80)
                    
                    VStack(spacing: 20) {
                        // email
                        CustomTextField(
                            text: $email,
                            placeholder: Text("Email"),
                            iconName: "envelope"
                        )
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10.0)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        
                        // password
                        CustomTextField(
                            text: $password,
                            placeholder: Text("Password"),
                            iconName: "lock"
                        )
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10.0)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        
                        // forgot password
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Forgot password?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.top)
                                    .padding(.trailing, 32)
                            })
                        }
                        
                        // sign in
                        Button(action: {}, label: {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: self.buttonWidth, height: 50)
                                .background(Color(.accent))
                                .clipShape(Capsule())
                                .padding()
                        })
                        Spacer()
                        // go to sign up
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                        })
                        .padding(.bottom, 32)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
