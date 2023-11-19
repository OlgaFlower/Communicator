//
//  UserStatView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 19.11.23.
//

import SwiftUI

struct UserStatView: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        
        VStack {
            Text("\(value)")
                .font(.system(size: 15.0, weight: .semibold))
            Text(title)
                .font(.system(size: 15.0))
        }
        .frame(width: 80, alignment: .center)
    }
}


#Preview {
    UserStatView(value: 1, title: "Post")
}
