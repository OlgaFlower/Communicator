//
//  LikesView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 20.12.23.
//

import SwiftUI

struct LikesView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: LikesViewModel
    
    // MARK: - Init
    init(postId: String?) {
        self.viewModel = LikesViewModel(postId: postId)
    }
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 18) {
                ForEach(self.viewModel.users) { user in
                    UserCell(user: user)
                }
            }
        }
    }
}

#Preview {
    LikesView(postId: "")
}
