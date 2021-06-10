//
//  ProblemasViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit
import Cards

class ProblemasViewController: UIViewController {
    
    struct problemario {
        let tipo: String!
        let nivel: String!
        let autor: String!
        let ligaDescarga: URL!
    }
    
    private let cardProblema: CardHighlight = {
        let card = CardHighlight(frame: .zero)
        //configure
        card.backgroundImage = UIImage(named: "fondo gradiente rojo opacity")
        card.icon = UIImage(named: "convocatoria")
        card.title = "Listado de Problemas"
        card.itemTitle = ""
        card.itemSubtitle = ""
        card.itemTitleSize = 20
        card.itemSubtitleSize = 15
        card.buttonText = "  LEER  "
        card.textColor = .black
        card.tintColor = .systemGreen
        return card
    }()
    

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .secondarySystemBackground
        return searchBar
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // navigationController?.navigationBar.topItem?.titleView = searchBar
    }
}
