//
//  UserCell.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    // MARK: - Properties
    let user: User
    private let imageWidth = 48.0
    
    // MARK: - Body
    var body: some View {
        
        HStack {
            UserImageView(userImgUrl: self.user.profileImageUrl ?? "")
                .frame(width: 48.0, height: 48.0)
            
            VStack(alignment: .leading) {
                Text(self.user.userName)
                    .font(.system(size: 14, weight: .semibold))
                Text(self.user.fullName)
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    UserCell(user:
                User(
                    userName: "yeva_2000",
                    email: "yeva2000@gmail.com",
                    profileImageUrl: "",
                    fullName: "Yeva Dow"
                )
    )
}
