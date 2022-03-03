//
//  ImageUploader.swift
//  ChatSwiftUI
//
//  Created by Caleb Danielsen on 02/03/2022.
//

import Firebase
import UIKit
import Combine

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: Constant.Storage.IMAGE_FOLDER + filename)
        
        // Uploading image to Firebase Storage database
        ref.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
                return
            }
            
            print("Image successfully uploaded image to firebase storage...")
            
            // Downloading the image-URL reference, corresponding to the uploaded image.
            ref.downloadURL { (url, error) in
                if let error = error {
                    print("Image url download failed... \(error.localizedDescription)")
                } else {
                    guard let imageURL = url?.absoluteString else { return }
                    print("Image url successfully downloaded...")
                    completion(imageURL)
                }
            }
        }
    }
}
