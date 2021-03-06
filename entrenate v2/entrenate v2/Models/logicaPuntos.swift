//
//  logicaPuntos.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 06/06/21.
//

import Foundation

class LogicaPuntos: NSObject {
    
    let niveles = ["Introductorio", "Regional", "Estatal", "Nacional", "Internacional"]
    // let problemas = Problemas()
    
    /// Regresa el nivel de problema que será presentado en todo el nivel
    public func tipoProblema(nivelUsuarioJuego: Int) -> String {
        if nivelUsuarioJuego >= 0 && nivelUsuarioJuego < 5 {
            return niveles[0]
        } else if nivelUsuarioJuego >= 5 && nivelUsuarioJuego < 10 {
            return niveles[1]
        } else if nivelUsuarioJuego >= 10 && nivelUsuarioJuego < 15 {
            return niveles[2]
        } else if nivelUsuarioJuego >= 15 && nivelUsuarioJuego < 20 {
            return niveles[3]
        } else if nivelUsuarioJuego >= 20 && nivelUsuarioJuego < 25 {
            return niveles[4]
        } else {
            let i = Int.random(in: 0..<5)
            return niveles[i]
        }
    }
    
    /// Regresa la cantidad base de puntos que será otorgado por problema de acuerdo al nivel
    public func puntosProblema(nivelUsuarioJuego: Int) -> Int{
        return (nivelUsuarioJuego+1)*500
    }
    
    /// Regresa la cantidad puntos necesaria para pasar de nivel
    public func puntosNivel(nivelUsuarioJuego: Int) -> Int{
        if nivelUsuarioJuego == 0 {
            return 2500
        }
            
        let mult = (nivelUsuarioJuego%5+1) * 5
        let puntosNuevos = mult * (nivelUsuarioJuego+1)*500
        return  puntosNuevos + puntosNivel(nivelUsuarioJuego: nivelUsuarioJuego - 1)
    }
    
    /// Regresa la cantidad de puntos a descontar por respuesta incorrecta por nivel
    public func puntosIncorrecta(nivelUsuarioJuego: Int) -> Int {
        return Int(((nivelUsuarioJuego+1)*500)/5)
    }
    
    /// Realiza lo necesario cuando se cambia de nivel
    public func cambiaNivel() {
        //let problemasDownload: String = problemas.getProblemas()
        //print(problemasDownload)
    }
    
    public func checkCambioNivel(nivel: Int, puntosAcumulados: Int) {
        if puntosAcumulados >= puntosNivel(nivelUsuarioJuego: nivel) {
            cambiaNivel()
        }
    }
}

