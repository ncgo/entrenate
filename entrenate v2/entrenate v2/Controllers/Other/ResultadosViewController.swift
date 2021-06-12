//
//  ResultadosViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 06/06/21.
//

import UIKit

class ResultadosViewController: UINavigationController {

    let resultados: UILabel = {
        let titulo = UILabel()
        titulo.text = "Aqui van los resultados"
        titulo.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titulo.textColor = .systemBlue
        titulo.textAlignment = .center
        return titulo
    }()
    
    let correctos: UILabel = {
        let titulo = UILabel()
        titulo.text = "Correctas"
        titulo.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titulo.textColor = .systemBlue
        titulo.textAlignment = .center
        titulo.translatesAutoresizingMaskIntoConstraints = false
        return titulo
    }()
    
    let intentados: UILabel = {
        let titulo = UILabel()
        titulo.text = "Intentados"
        titulo.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titulo.textColor = .systemBlue
        titulo.textAlignment = .center
        return titulo
    }()
    
    let noIntentados: UILabel = {
        let titulo = UILabel()
        titulo.text = "No intentados"
        titulo.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titulo.textColor = .systemBlue
        titulo.textAlignment = .center
        return titulo
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(resultados)
        view.addSubview(correctos)
        view.addSubview(intentados)
        view.addSubview(noIntentados)
    }
    

    func labelsConfig() {
        resultados.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        resultados.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        correctos.frame = CGRect(x:  view.width + 10, y: view.height/4, width: 20, height: 20)
        intentados.frame = CGRect(x: 2*view.width + 10, y: view.height/4, width: 20, height: 20)
        noIntentados.frame = CGRect(x: 3*view.width + 10, y: view.height/4, width: 20, height: 20)
    }

}
