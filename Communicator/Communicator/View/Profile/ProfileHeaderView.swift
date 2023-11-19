//
//  ProfileHeaderView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 19.11.23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Image("avatar4")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 12) {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 4, title: "Following")
                }
            }
            .padding(.horizontal)
            
            Text("Bahiti Abdelaal")
                .font(.system(size: 15.0, weight: .semibold))
                .padding(.top)
                .padding(.leading)
            
            Text("UI/UX Designer | Blogger")
                .font(.system(size: 15.0))
                .padding(.leading)
                .padding(.top, 1)
        }
        
        HStack {
            Spacer()
            
            ProfileActionButtonView()
            
            Spacer()
        }
    }
}

#Preview {
    ProfileHeaderView()
}
