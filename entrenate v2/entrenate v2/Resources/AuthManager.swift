//
//  DatabaseManager.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    // MARK: -Public
    
    public func registerNewUser(name: String, username: String, email: String, password: String, Ciudad: String, nivelEducativo: String, gradoEtapa: String, escuela: String, completion: @escaping (Bool) -> Void) {
        // Check if username is available
        // Check if email is available
        // Create account
        // Insert account to database
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                // Create account
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        //Firebase Auth could not create account
                        completion(false)
                        return
                    }
                    // Insert account to database
                    DatabaseManager.shared.insertNewUser(with: name, email: email, username: username, Ciudad: Ciudad, nivelEducativo: nivelEducativo, gradoEtapa: gradoEtapa, escuela: escuela) { inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            // Failed to onsert to database
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                // Either username or email exists
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) ->  Void) {
        let defaults = UserDefaults.standard
        let userID = Auth.auth().currentUser?.uid
        defaults.set(userID, forKey: "userID")
        
        if let email = email {
            //Email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username {
            //Accept auth with user
            print(username)
        }
    }
    
    /// Attempt to logout firebase user
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
    }
    
/*
    public func changeRequest(username: String, ) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = username
        changeRequest?.photoURL = url
        
        changeRequest?.commitChanges(completion: )
    }
 */
}
