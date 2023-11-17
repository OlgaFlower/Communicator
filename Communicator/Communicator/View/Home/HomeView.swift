//
//  HomeView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(0..<10) { _ in
                    HomeCell()
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    HomeView()
}
