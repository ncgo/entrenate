//
//  problemaNivelLogica.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 06/06/21.
//

import Foundation

class Problema {
    private func nivelJuego(nivelOlimpico: String) -> Int{
        if nivelOlimpico == "Introductorio" {
            return 0
        } else if nivelOlimpico == "Regional" {
            return 1
        } else if nivelOlimpico == "Estatal" {
            return 2
        } else if nivelOlimpico == "Nacional" {
            return 3
        } else if nivelOlimpico == "Internacional" {
            return 4
        } else {
            return 5
        }
    }
    
    private func puntosJuego(nivelOlimpico: String) -> Int{
        if nivelOlimpico == "Introductorio" {
            return 500
        } else if nivelOlimpico == "Regional" {
            return 1000
        } else if nivelOlimpico == "Estatal" {
            return 2000
        } else if nivelOlimpico == "Nacional" {
            return 4000
        } else if nivelOlimpico == "Internacional" {
            return 8000
        } else {
            return 5000
        }
    }
}
