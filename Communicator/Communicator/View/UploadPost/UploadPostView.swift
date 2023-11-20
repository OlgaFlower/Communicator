//
//  UploadPostView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    
    private let addButtonWidth = 112.0
    private var shareButtonWidth = UIScreen.main.bounds.width * 0.8
    
    var body: some View {
        
        VStack {
            if self.postImage == nil {
                Button(action: {
                    self.imagePickerPresented.toggle()
                }, label: {
                    Image("add")
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
            } else if let image = self.postImage {
                
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption..", text: $captionText)
                }
                .padding()
                
                Button(action: {
                    
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
            
            Spacer()
        }
    }
}

extension UploadPostView {
    
    func loadImage() {
        guard let selectedImage = self.selectedImage else { return }
        self.postImage = Image(uiImage: selectedImage)
    }
    
}

#Preview {
    UploadPostView()
}
