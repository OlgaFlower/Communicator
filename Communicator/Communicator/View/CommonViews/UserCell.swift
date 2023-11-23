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
    let user: UserModel
    
    // MARK: - Body
    var body: some View {
        
        HStack {
            UserImageView(userImgUrl: self.user.profileImageUrl ?? "")
            
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
                UserModel(
                    userName: "yeva_2000",
                    email: "yeva2000@gmail.com",
                    profileImageUrl: "",
                    fullName: "Yeva Dow"
                )
    )
}
