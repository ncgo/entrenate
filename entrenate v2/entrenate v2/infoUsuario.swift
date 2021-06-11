//
//  infoUsuario.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 11/06/21.
//

import UIKit
import Firebase

class infoUsuario: NSObject {
    public var username: String!
    public var nivel: Int!
    public var puntosAcumulados: Int!
    public var problemasResueltos: [String]!
    
    init(username: String, nivel: Int, puntosAcumulados: Int, problemasResueltos: [String]) {
        self.username = username
        self.nivel = nivel
        self.puntosAcumulados = puntosAcumulados
        self.problemasResueltos = problemasResueltos
    }
}
