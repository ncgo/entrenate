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
    public func insertNewUser(with name: String, email: String, username: String, Ciudad: String, nivelEducativo: String, gradoEtapa: String, escuela: String,  completion: @escaping (Bool) -> Void) {
        let user: [String: Any] = [
            "name": name,
            "username": username,
            "email": email,
            "nivelUsuarioJuego": 0,
            "puntosAcumulados" : 0,
            "escuela" : escuela,
            "ciudad" : Ciudad,
            "nivelEducativo": nivelEducativo,
            "grado": gradoEtapa,
            "estado" : "Chihuahua"
        ]
        database.child(email.safeDatabaseKey()).setValue(
            user) { error,  _ in
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
    
    /// Read user data from database
    public func readUserData(dbKey: String) {
        database.child(dbKey).observeSingleEvent(of: .value, with: { snapshot in
            guard let userData = snapshot.value as? [String: Any] else { return }
            let defaults = UserDefaults.standard
            defaults.set(userData["username"], forKey: "Username")
            defaults.set(userData["name"], forKey: "Name")
            defaults.set(userData["email"], forKey: "Email")
            defaults.set(userData["nivelUsuarioJuego"], forKey: "NivelUsuarioJuego")
            defaults.set(userData["puntosAcumulados"], forKey: "PuntosAcumulados")
            defaults.set(userData["escuela"], forKey: "Escuela")
            defaults.set(userData["ciudad"], forKey: "Ciudad")
            defaults.set(userData["estado"], forKey: "Estado")
            defaults.set(dbKey, forKey: "dbKey")
        })
    }
    
    /// Log sesion de competencia
    /*
    public func logSesionCompetencia(t0: String, numProblemas: String) {
        let sesion: [String: Any] = [
            "tiempoEscogido":
        ]
        database.child(email.safeDatabaseKey()).setValue(
            user) { error,  _ in
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
    }*/
}
