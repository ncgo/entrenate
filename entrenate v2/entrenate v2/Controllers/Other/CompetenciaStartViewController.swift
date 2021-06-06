//
//  CompetenciaStartViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//
import Cards
import ShimmerSwift
import UIKit

class CompetenciaStartViewController: UIViewController, UIPickerViewAccessibilityDelegate, UIPickerViewDataSource {
    
    var tiempoSeleccionado: String = "15 minutos"
    
    let timeToPick = ["15 minutos", "30 minutos", "45 minutos", "1 hora", "1 hora 30 minutos*"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeToPick.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       let row = timeToPick[row]
       return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let timeSelected = pickerView.selectedRow(inComponent: 0)
        if timeSelected == 4 {
            showAdvertencia(show: true)
        } else {
            showAdvertencia(show: false)
        }
        tiempoSeleccionado = timeToPick[timeSelected]
    }
    
    private let cardTitulo: CardHighlight = {
        let card  = CardHighlight()
        card.title = "Modo competencia"
        card.itemTitle = "Gana puntos y sube de nivel"
        card.itemSubtitle = ""
        card.backgroundImage = UIImage(named: "fondo gradiente amarillo opacity")
        card.textColor = .white
        card.buttonText = nil
        card.icon = UIImage(named: "competencia")
        return card
    }()
    
    private let instrucciones: UILabel = {
        let label = UILabel()
        label.text = "Tendrás un límite de tiempo para contestar \ncorrectamente la mayor cantidad de problemas. \n\nTienes intentos ilimitados, pero cada vez que \nte equivoques, se te restarán puntos. \n\nSelecciona la duración de esta sesión."
        label.textColor = .secondaryLabel
        label.numberOfLines = 8
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 15.0)
        return label
    }()
    
    private let timePicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    private let botonIr: UIButton = {
        let botonIr = UIButton()
        botonIr.setTitle("Iniciar", for: .normal)
        botonIr.layer.masksToBounds = true
        botonIr.layer.cornerRadius = 8.0
        botonIr.backgroundColor = .systemBlue
        botonIr.setTitleColor(.white, for: .normal)
        return botonIr
    }()
    
    private let advertencia: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .systemRed
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10.0)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(cardTitulo)
        view.addSubview(instrucciones)
        view.addSubview(timePicker)
        view.addSubview(botonIr)
        view.addSubview(advertencia)
        botonIr.addTarget(self, action: #selector(didTapBotonIr), for: .touchUpInside)
        timePicker.delegate = self
        timePicker.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cardTitulo.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 20, width: view.frame.size.width - 20, height: view.frame.size.height/3.5)
        instrucciones.frame = CGRect(x: 20, y: cardTitulo.bottom + 20, width: view.frame.size.width - 40, height: 150)
        timePicker.frame = CGRect(x: 20, y: instrucciones.bottom, width: view.frame.size.width - 40, height: 100)
        advertencia.frame = CGRect(x: 20, y: timePicker.bottom, width: view.frame.size.width - 40, height: 20)
        botonIr.frame = CGRect(x: view.frame.size.width/4, y: timePicker.bottom + 50, width: view.frame.size.width/2, height: 50)
    }
    
    @IBAction func showAdvertencia(show: Bool) {
        if show {
            advertencia.text = "*Recomendado solamente para Nivel 1"
        } else {
            advertencia.text = ""
        }
    }
    
    @objc private func didTapBotonIr() {
        let vc = SeleccionProblemasViewController()
        vc.tiempoSeleccionado = tiempoSeleccionado
        vc.cantidadProblemas = cantidadProblemas(tiempo: tiempoSeleccionado)!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func cantidadProblemas(tiempo: String) -> Int? {
        if tiempo == "15 minutos" {
            return 3
        } else if tiempo == "30 minutos" {
            return 6
        } else if tiempo == "45 minutos" {
            return 9
        } else if tiempo == "1 hora" {
            return 12
        } else {
            return 15
        }
    }
    
}
