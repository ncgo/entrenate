//
//  CompetenciaStartViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit

class CompetenciaStartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.popToRootViewController(animated: true)
    }

}
