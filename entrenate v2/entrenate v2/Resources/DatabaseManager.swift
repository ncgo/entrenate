//
//  DatabaseManager.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: -Public
    
    /// Check is username and email is available
    /// - Parameters
    /// - email: String representing email
    /// - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    /// Inserts new user data to database
    /// - Parameters
    /// - email: String representing email
    /// - username: String representing username
    /// - completion: Async callback for result if database entry suceeded
    public func insertNewUser(with email: String, username: String, escuela: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(
            ["username": username,
             "nivelUsuarioJuego": 0,
             "puntosAcumulados" : 0,
             "escuela" : escuela,
             "ciudad" : "Ciudad Juarez",
             "estado" : "Chihuahua"]) { error,  _ in
            if error == nil {
                //success
                completion(true)
                return
            } else {
                // failed
                completion(false)
                return
            }
        }
    }
    
    
    
    
}
