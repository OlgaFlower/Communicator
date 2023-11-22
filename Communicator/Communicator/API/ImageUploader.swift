//
//  ImageUploader.swift
//  Communicator
//
//  Created by Olha Bereziuk on 22.11.23.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(image: UIImage?, completion: @escaping(String?) -> Void) {
        
        guard let img = image, let imageData = img.jpegData(compressionQuality: 0.5) else {
            completion(nil)
            return
        }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                // TODO: - Handle error
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            print("Successfully uploaded image...")
            
            ref.downloadURL { url, error in
                // TODO: - Handle error
                guard let imageURL = url?.absoluteString else { return }
                completion(imageURL)
            }
        }
    }
}
