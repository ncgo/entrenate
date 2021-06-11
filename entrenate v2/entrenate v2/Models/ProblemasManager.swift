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
    
    var listaProblemas = [Problema]()
    
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
    
    func getProblemsByLevel(numProblemas: Int, nivelProblema: String) -> [Problema] {
        let problemas = db.collection("ProblemasApp")
        let problemasNivel = problemas.whereField("nivel", isEqualTo: nivelProblema)
        var listaSesion = [Problema]()
        problemasNivel.getDocuments() { [self](querySnapshot, err) in
            let documents = querySnapshot!.documents
            try! documents.forEach { document in
                let problema: Problema = try document.decoded()
                listaProblemas.append(problema)
            }
            listaSesion = getProblemsByLevelByTime(numProblemas: numProblemas, nivelProblema: nivelProblema, listaProblema: listaProblemas)
        }
        return listaSesion
    }

    func getProblemsByLevelByTime(numProblemas: Int, nivelProblema: String, listaProblema: [Problema]) -> [Problema] {
        var listaSesion = [Problema]()
        for _ in Range(1...numProblemas) {
            let random = Int.random(in: 0..<listaProblemas.count)
            listaSesion.append(listaProblema[random])
            listaProblemas.remove(at: random)
        }
        print("Lista Sesion \(listaSesion.count)")
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
