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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
        do {
            try Auth.auth().signOut()
        } catch {
            print("failed to sign out")
        }
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


}

