//
//  EntrenamientoStartViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit

class EntrenamientoStartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.popToRootViewController(animated: true)
    }

}
