//
//  ViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
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

