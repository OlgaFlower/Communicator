//
//  UserImageView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 23.11.23.
//

import SwiftUI
import Kingfisher

struct UserImageView: View {
    
    // MARK: - Properties
    let userImgUrl: String
    private let defaultImage = Image("defaultUserImage")
    
    // MARK: - Body
    var body: some View {
        if userImgUrl.isEmpty {
            self.defaultImage
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .foregroundColor(.gray)
                .clipShape(Circle())
        } else {
            KFImage(URL(string: userImgUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
        }
    }
}

// MARK: - Preview
#Preview {
    UserImageView(userImgUrl: "")
}
