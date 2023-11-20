//
//  RegistrationView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 20.11.23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullName = ""
    @State private var userName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    
    private let buttonWidth = UIScreen.main.bounds.width * 0.8
    
    var body: some View {
        
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
                    
                    Button(action: {
                        
                    }, label: {
                        Image("add")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .padding(.vertical, 32)
                    })
                    
                    VStack(spacing: 20) {
                        
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
                        
                        CustomTextField(
                            text: $email,
                            placeholder: Text("Username"),
                            iconName: "person"
                        )
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10.0)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        
                        CustomTextField(
                            text: $email,
                            placeholder: Text("Full Name"),
                            iconName: "person"
                        )
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10.0)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        
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
                        
                        Button(action: {}, label: {
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: self.buttonWidth, height: 50)
                                .background(Color(.accent))
                                .clipShape(Capsule())
                                .padding()
                        })
                        
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
                            .foregroundColor(.white)
                        })
                        .padding(.bottom, 16)
                    }
                }
            }
        }
    }

#Preview {
    RegistrationView()
}
