//
//  MenuView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.02.24.
//

import SwiftUI

struct MenuView: View {
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            self.makeMenuView(icon: "logout", title: "Log out")
        }
        .padding([.leading, .top], 24)
        Spacer()
    }
    
    // MARK: - Views
    
    private func makeMenuView(icon: String, title: String) -> some View {
        
        HStack(alignment: .top, spacing: 20) {
            Image(icon)
                .frame(width: 20, height: 20)
                .padding(.top, 2)
            
            VStack(alignment: .leading) {
                Button(action: {
                    AuthViewModel.shared.signOut()
                }, label: {
                    Text(title).foregroundColor(.black)
                        .font(.system(size: 18))
                })
                
                SeparatorView()
            }
        }
    }
}

#Preview {
    MenuView()
}
