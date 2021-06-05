//
//  DatabaseManager.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//  Reference: Build Instagram App: Part 6 (Swift 5) - 2020 - Xcode 11 - iOS Development
//  iOS Academy
//  youtu.be/B4XTcnNLRy8

import FirebaseStorage

public class StorageManager {
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum storageManagerError: Error {
        case failedToDownload
    }
    
    // MARK: -Public
    public func downloadFile(with reference: String, completion: @escaping (Result<URL, storageManagerError>) -> Void) {
        bucket.child(reference).downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        })
    }
}
