//
//  SearchBar.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import SwiftUI

struct SearchBar: View {
    
    // MARK: - Properties
    @Binding var text: String
    @Binding var isEditing: Bool
    
    // MARK: - Body
    var body: some View {
        
        HStack {
            self.searchView
            
            if self.isEditing {
                self.showCancelButton()
            }
        }
    }
    
    // MARK: - Views
    private var searchView: some View {
        TextField("Search...", text: $text)
            .padding(8)
            .padding(.horizontal, 24)
            .background(Color(.systemGray6))
            .cornerRadius(8.0)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0.0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8.0)
                }
            )
            .onTapGesture {
                self.isEditing = true
            }
    }
    
    private func showCancelButton() -> some View {
        Button(action: {
            self.isEditing = false
            self.text = ""
            UIApplication.shared.endEditing()
        }, label: {
            Text("Cancel")
                .foregroundStyle(.black)
        })
        .padding(.trailing, 8.0)
        .transition(.move(edge: .trailing))
    }
}

// MARK: - Preview
#Preview {
    SearchBar(text: .constant("Search..."), isEditing: (.constant(false)))
}
