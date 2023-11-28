//
//  ImageUploader.swift
//  Communicator
//
//  Created by Olha Bereziuk on 22.11.23.
//

import UIKit
import FirebaseStorage

enum UploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let fileName = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(fileName)")
        }
    }
}

struct ImageUploader {
    
    static func uploadImage(image: UIImage?, type: UploadType, completion: @escaping(String?) -> Void) {
        
        guard let img = image, let imageData = img.jpegData(compressionQuality: 0.5) else {
            completion(nil)
            return
        }
        
        let ref = type.filePath
        
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
