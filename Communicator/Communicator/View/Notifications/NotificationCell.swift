//
//  NotificationCell.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var showPostImage = false
    
    var body: some View {
        
        HStack {
            Image("avatar3")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            Text("Lisa_32")
                .font(.system(size: 14, weight: .semibold))
            +
            Text(" liked one of your posts.")
                .font(.system(size: 15))
            
            Spacer()
            
            if showPostImage {
                Image("avatar3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
            } else {
                Button {
                    
                } label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }

            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
