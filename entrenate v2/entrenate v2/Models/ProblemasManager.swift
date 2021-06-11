//
//  ProblemasManager.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 11/06/21.
//

import Foundation
import Firebase

class ProblemasManager {
    let db = Firestore.firestore()
    
    func getAllProblems() {
        db.collection("ProblemasApp").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    func getProblemsByLevel(nivelProblema: String) -> [Problema] {
        let problemas = db.collection("ProblemasApp")
        let problemasNivel = problemas.whereField("nivel", isEqualTo: nivelProblema)
        print("check")
        var listaProblemas = [Problema]()
        problemasNivel.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let problema: Problema = try! document.decoded()
                    print(type(of: problema))
                    listaProblemas.append(problema)
                }
            }
        }
        return listaProblemas
    }
    
    func getProblemsByLevelByTime(numProblemas: Int, nivelProblema: String) -> [Problema] {
        var listaProblemasDisponibles = getProblemsByLevel(nivelProblema: nivelProblema)
        print(listaProblemasDisponibles.count)
        print("Hey \(numProblemas)")
        print(nivelProblema)
        var listaSesion = [Problema]()
        for _ in Range(0...numProblemas) {
            let random = Int.random(in: 0..<listaProblemasDisponibles.count)
            listaSesion.append(listaProblemasDisponibles[random])
            listaProblemasDisponibles.remove(at: random)
        }
        return listaSesion
    }
}

struct Problema: Codable {
    let area: String!
    let descripcion: String
    let fuente: String!
    let nivel: String
    let respuesta: String
    let titulo: String!
    
}

extension QueryDocumentSnapshot {
    func decoded<Type: Decodable>() throws -> Type {
        let jsonData = try JSONSerialization.data(withJSONObject: data(), options: [])
        let object = try JSONDecoder().decode(Type.self, from: jsonData)
        return object
    }
}
