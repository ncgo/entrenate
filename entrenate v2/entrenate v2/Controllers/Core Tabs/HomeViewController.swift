//
//  ViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//
import FirebaseAuth
import SafariServices
import Cards
import UIKit

class HomeViewController: UIViewController, CardDelegate {
    
    let scrollView = UIScrollView()
    private var cardHeight : CGFloat = 0
    
    private let cardConsejos: CardHighlight = {
        let card = CardHighlight(frame: .zero)
        //configure
        card.backgroundImage = UIImage(named: "fondo gradiente verde opacity")
        card.icon = UIImage(named: "consejos")
        card.title = "CONSEJOS"
        card.itemTitle = "Con Katia García"
        card.itemSubtitle = "Delegada Regional Ciudad Juárez"
        card.itemTitleSize = 20
        card.itemSubtitleSize = 15
        card.buttonText = "  LEER  "
        card.textColor = .white
        card.tintColor = .systemBlue
        return card
    }()
    
    private let cardConvocatoria: CardHighlight = {
        let card = CardHighlight(frame: .zero)
        //configure
        card.backgroundImage = UIImage(named: "convocatoria fb")
        card.icon = nil
        card.title = ""
        card.itemTitle = ""
        card.itemSubtitle = ""
        card.itemTitleSize = 20
        card.itemSubtitleSize = 15
        card.buttonText = "  LEER  "
        card.textColor = .black
        card.tintColor = .systemGreen
        return card
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        
        cardHeight = self.view.frame.width
        
        scrollView.frame = self.view.bounds
        
        cardConsejos.shouldPresent(ConsejosViewController(), from: self, fullscreen: true)
        cardConsejos.delegate = self
        cardConvocatoria.delegate = self
        
        scrollView.addSubview(cardConsejos)
        scrollView.addSubview(cardConvocatoria)
        
        scrollView.contentSize = CGSize(width:self.view.width, height: (cardHeight+20) * 2.1)
        
        view.addSubview(scrollView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        cardConvocatoria.frame = CGRect(x: 10, y: 10, width: view.frame.size.width - 20, height: cardHeight)
        cardConsejos.frame = CGRect(x: 10, y: (cardHeight+20),
                                    width: view.frame.size.width - 20, height: cardHeight)
    }
    
    
    
    
    func cardHighlightDidTapButton(card: CardHighlight, button: UIButton) {
        if card == cardConvocatoria {
            guard let url = URL(string:"https://www.facebook.com/ommch/photos/a.110373428975073/4390527234292983/") else {
                return
            }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)

        } else {
            let vc = ConsejosViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }
    
    private func handleNotAuthenticated() {
        //Check auth status
        if Auth.auth().currentUser == nil {
            //Show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .done, target: self, action: #selector(didTapNotificationsButton))
        navigationItem.rightBarButtonItem?.tintColor = .systemYellow
    }

    @objc private func didTapNotificationsButton() {
        let vc = NotificationsViewController()
        vc.title = "Notificaciones"
        navigationController?.pushViewController(vc, animated: true)
    }
}

class ConsejosViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
    }
}
