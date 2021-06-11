//
//  problemas.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 11/06/21.
//

import Foundation
import Firebase

public class Problemas: NSObject {
    let db = Firestore.firestore()
    let manager = FileManager.default
    let logicaPuntos = LogicaPuntos()
    // let settings = FirestoreSettings()
    
    // settings.isPersistenceEnabled = true
    
    func getProblemas() {
        //var lista: String = ""
        db.collection("ProblemasApp").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    //lista.append("\(document.documentID) => \(document.data())")
                }
            }
        }
        //return lista
    }
    
    func getProblemasNivel(nivel: Int) {
        let nivelProblema = logicaPuntos.tipoProblema(nivelUsuarioJuego: nivel)
        let problemas = db.collection("ProblemasApp")
        let query = problemas.whereField("nivel", isEqualTo: nivelProblema)
        print(query)
    }
    
}
