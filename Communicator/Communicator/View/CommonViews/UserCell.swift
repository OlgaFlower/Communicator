//
//  UserCell.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import SwiftUI

struct UserCell: View {
    
    private let imageWidth = 48.0
    
    var body: some View {
        
        HStack {
            Image("avatar2")
                .resizable()
                .scaledToFill()
                .frame(width: self.imageWidth, height: self.imageWidth)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("yeva_2000")
                    .font(.system(size: 14, weight: .semibold))
                Text("Yeva Orlando")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

#Preview {
    UserCell()
}
