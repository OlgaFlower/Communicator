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
    private let imageWidth = 48.0
    
    // MARK: - Body
    var body: some View {
        if userImgUrl.isEmpty {
            defaultImage
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .foregroundColor(.gray)
                .frame(width: self.imageWidth, height: self.imageWidth)
                .clipShape(Circle())
        } else {
            KFImage(URL(string: userImgUrl))
                .resizable()
                .scaledToFill()
                .frame(width: self.imageWidth, height: self.imageWidth)
                .clipShape(Circle())
        }
    }
}

// MARK: - Preview
#Preview {
    UserImageView(userImgUrl: "")
}
