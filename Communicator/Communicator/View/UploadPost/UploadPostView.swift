//
//  UploadPostView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct UploadPostView: View {
    
    // MARK: - Properties
    @Binding var tabIndex: Int
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    
    private let addButtonWidth = 112.0
    var shareButtonWidth = UIScreen.main.bounds.width * 0.8
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            if self.postImage == nil {
                self.showAddButton()
            } else if let image = self.postImage {
                
                HStack(alignment: .top, spacing: 8) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                        .padding(.top, 4)
                    
                    TextArea(
                        text: self.$captionText,
                        placeholder: "Enter caption..."
                    )
                    .frame(height: 96)
                }
                .padding()
                
                self.showShareButtonView()
            }
            Spacer()
        }
        .font(.body)
    }
    
    // MARK: - Views
    private func showAddButton() -> some View {
        Button(action: {
            self.imagePickerPresented.toggle()
        }, label: {
            Image("uploadImageIcon")
                .resizable()
                .scaledToFill()
                .frame(width: self.addButtonWidth, height: self.addButtonWidth)
                .clipped()
                .padding(.top, 62)
        }).sheet(
            isPresented: $imagePickerPresented,
            onDismiss: self.loadImage,
            content: {
                ImagePicker(image: $selectedImage)
            })
    }
    
    private func showShareButtonView() -> some View {
        Button(action: {
            guard let image = self.selectedImage else { return }
            self.viewModel.uploadPost(caption: captionText, image: image) { _ in
                self.captionText = ""
                self.postImage = nil
                self.tabIndex = 0
            }
        }, label: {
            Text("Share")
                .font(.system(size: 16.0, weight: .semibold))
                .frame(width: self.shareButtonWidth, height: 50)
                .background(Color.blue)
                .cornerRadius(5.0)
                .foregroundColor(.white)
        })
        .padding()
    }
}

// MARK: - Extension
extension UploadPostView {
    func loadImage() {
        guard let selectedImage = self.selectedImage else { return }
        self.postImage = Image(uiImage: selectedImage)
    }
}

// MARK: - Preview
#Preview {
    UploadPostView(tabIndex: .constant(0))
}
