//
//  Models.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 05/06/21.
//

import Foundation

struct Usuario {
    /// Información general
    let username: String
    let name: (first: String, last: String)
    let bio: String
    let escuela: String
    let ciudad: String
    let estado: String
    let grado: (anio: Int, gradoEscolar: String)
    let joinDate: Date
    
    /// Información del juego
    let puntos: Int //Acumulados, determinan el nivel
    let nivel: Int
    let streakProblemas: Int // Cantidad de problemas resueltos sucesivamente en modo entrenamiento sin errores
    let accomplishments: [Accomplishment]
    
    // 
    let lastLoggedIn: Date
    let streakDays: Int
}

struct Accomplishment {
    let title: String
    let description: String
    let achievedOn: Date
    let badge: URL
}
