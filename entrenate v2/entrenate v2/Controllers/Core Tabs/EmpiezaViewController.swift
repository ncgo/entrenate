//
//  EmpiezaViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import Cards
import UIKit

class EmpiezaViewController: UIViewController {
    
    private let cardCompetencia: CardHighlight = {
        let card = CardHighlight(frame: .zero)
        //configure
        card.backgroundImage = UIImage(named: "fondo gradiente amarillo opacity")
        card.icon = UIImage(named: "competencia")
        card.title = "COMPETENCIA"
        card.itemTitle = "Modo Competencia"
        card.itemSubtitle = "Gana puntos bajo reloj"
        card.itemTitleSize = 20
        card.itemSubtitleSize = 15
        card.buttonText = "  Juega  "
        card.textColor = .white
        card.tintColor = .systemBlue
        return card
    }()
    
    private let cardEntrenamiento: CardHighlight = {
        let card = CardHighlight(frame: .zero)
        //configure
        card.backgroundImage = UIImage(named: "fondo gradiente azul opacity")
        card.icon = UIImage(named: "entrenamiento")
        card.title = "ENTRENAMIENTO"
        card.itemTitle = "Modo Entrenamiento"
        card.itemSubtitle = "Entrena y practica"
        card.buttonText = " Practica "
        card.itemTitleSize = 20
        card.itemSubtitleSize = 15
        card.textColor = .white
        card.tintColor = .systemBlue
        return card
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardCompetencia.shouldPresent(CompetenciaStartViewController(), from: self, fullscreen: true)
        view.addSubview(cardCompetencia)
        view.addSubview(cardEntrenamiento)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cardCompetencia.frame = CGRect(x: 10, y: view.frame.size.height/6 - 10, width: view.frame.size.width - 20, height: view.frame.size.height/3)
        cardEntrenamiento.frame = CGRect(x: 10, y: cardCompetencia.bottom + 20, width: view.frame.size.width - 20, height: view.frame.size.height/3)
    }
    

}
