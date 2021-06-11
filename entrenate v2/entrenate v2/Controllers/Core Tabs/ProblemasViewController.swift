//
//  ProblemasViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit
import Cards
import SafariServices

class ProblemasViewController: UIViewController, CardDelegate {
    
    let scrollView = UIScrollView()
    private var cardHeight : CGFloat = 0
    
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
        card.title = "problemario"
        card.itemTitle = "problemas prenacional"
        card.itemSubtitle = "recopilado por Katia Garcia"
        card.itemTitleSize = 20
        card.itemSubtitleSize = 15
        card.buttonText = "  LEER  "
        card.textColor = .white
        card.tintColor = .systemBlue
        return card
    }()
    
    private let cardProblema2: CardHighlight = {
        let card = CardHighlight(frame: .zero)
        //configure
        card.backgroundImage = UIImage(named: "fondo gradiente rojo opacity")
        card.icon = UIImage(named: "convocatoria")
        card.title = "problemario"
        card.itemTitle = "problemas prenacional"
        card.itemSubtitle = "recopilado por Katia Garcia"
        card.itemTitleSize = 20
        card.itemSubtitleSize = 15
        card.buttonText = "  LEER  "
        card.textColor = .white
        card.tintColor = .systemBlue
        return card
    }()

    private let cardProblema3: CardHighlight = {
        let card = CardHighlight(frame: .zero)
        //configure
        card.backgroundImage = UIImage(named: "fondo gradiente rojo opacity")
        card.icon = UIImage(named: "convocatoria")
        card.title = "problemario"
        card.itemTitle = "problemas prenacional"
        card.itemSubtitle = "recopilado por Katia Garcia"
        card.itemTitleSize = 20
        card.itemSubtitleSize = 15
        card.buttonText = "  LEER  "
        card.textColor = .white
        card.tintColor = .systemBlue
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
        
        cardHeight = view.frame.size.height/3
        
        scrollView.frame = self.view.bounds
        
        cardProblema.delegate = self
        
        scrollView.addSubview(cardProblema)
        scrollView.addSubview(cardProblema2)
        scrollView.addSubview(cardProblema3)
        
        scrollView.contentSize = CGSize(width:self.view.width, height: (cardHeight+20) * 3.1)
        
        view.addSubview(scrollView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        cardProblema.frame = CGRect(x: 10, y: 20, width: view.frame.size.width - 20, height: cardHeight)
        cardProblema2.frame = CGRect(x: 10, y: (cardHeight+20) + 20,
                                    width: view.frame.size.width - 20, height: cardHeight)
        cardProblema3.frame = CGRect(x: 10, y: (cardHeight+20)*2 + 20,
                                    width: view.frame.size.width - 20, height: cardHeight)
    }
    
    func cardHighlightDidTapButton(card: CardHighlight, button: UIButton) {
        if card == cardProblema || card == cardProblema2 {
            guard let url = URL(string:"https://drive.google.com/file/d/1ZoQGagzqsuKRrn4LnVYlfS5VkzN3fEYC/view") else {
                return
            }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)

        }
    }
}
