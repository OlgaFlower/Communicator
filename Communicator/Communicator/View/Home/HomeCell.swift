//
//  HomeCell.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct HomeCell: View {
    
    private let imageFrame = 36.0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            self.userInfo
            .padding([.leading, .bottom], 8)
            
            self.postImage
            
            HStack(spacing: 16) {
                self.makeButton(iconName: "heart")
                self.makeButton(iconName: "bubble.right")
                self.makeButton(iconName: "paperplane")
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            // caption
            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text("Maruna")
                    .font(.system(size: 14, weight: .semibold))
                +
                Text(" Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.")
                    .font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, 4)
        }
    }
    
    private var userInfo: some View {
        HStack {
            Image("avatar1")
                .resizable()
                .scaledToFill()
                .frame(width: self.imageFrame, height: self.imageFrame)
                .clipped()
                .cornerRadius(self.imageFrame / 2)
            
            Text("Maruna")
                .font(.system(size: 14, weight: .semibold))
        }
    }
    
    private var postImage: some View {
        Image("item1")
            .resizable()
            .scaledToFill()
            .frame(maxHeight: 400)
            .clipped()
    }
    
    private func makeButton(iconName: String) -> some View {
        Button {
            
        } label: {
            Image(systemName: iconName)
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
                .font(.system(size: 20))
                .padding(4)
            
        }
    }
}

#Preview {
    HomeCell()
}
