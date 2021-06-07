//
//  SeleccionProblemasViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit
import Cards

class SeleccionProblemasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct problema {
        let area: String
        let titulo: String
        let nivel: String
    }
    
    struct sesion {
        let dateSesion: Date
        let numProblems: Int
        let time: Timer
        
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var problemas = [[problema]]()
    func numberOfSections(in tableView: UITableView) -> Int {
        return problemas.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problemas[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = problemas[indexPath.section][indexPath.row].area
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProblemaViewController()
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    
    var tiempoSeleccionado: String = "0"
    var cantidadProblemas: Int = 12
    var puntosAcumulados: Int!
    var countDownTimer: Timer!
    
    
    private let cardTitulo: CardArticle = {
        let card = CardArticle()
        card.category = "problemas"
        card.title = "COMPETENCIA"
        card.backgroundImage = UIImage(named: "fondo gradiente amarillo opacity")
        card.subtitle = "puntos acumulados"
        card.textColor = .white
        return card
    }()
    
    private let labelTimer: UILabel = {
        let label = UILabel()
        label.text = "--:--"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        print("El tiempo para esta sesion es de \(tiempoSeleccionado)")
        print("Responderás \(String(cantidadProblemas)) problemas")
        numProblemas(num: cantidadProblemas)
        let newBackButton = UIBarButtonItem(title: "Terminar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapBack))
        newBackButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = newBackButton
        view.addSubview(cardTitulo)
        createTimer(tiempo: Int(getSeconds(tiempo: tiempoSeleccionado)))
        configureModels()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(labelTimer)
        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cardTitulo.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 20, width: view.frame.size.width - 20, height: view.frame.size.height/6)
        labelTimer.frame = CGRect(x: 10, y: cardTitulo.bottom + 10, width: view.frame.size.width - 20, height: 50)
        tableView.frame = CGRect(x: 10, y: labelTimer.bottom + 20, width: view.frame.size.width - 20, height: view.frame.size.height/2)
    }
    
    var totalTime: Int!
    
    @objc func actualizaLabelTimer() {
        labelTimer.text = "\(timeFormatted(totalTime))"
        if totalTime != 0 {
            totalTime -= 1
        }
        else {
            didFinishTime()
        }
        
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    private func getSeconds(tiempo: String) -> Double {
        if tiempo == "15 minutos" {
            totalTime = 15*60
            return 15*60
        } else if tiempo == "30 minutos" {
            totalTime = 30*60
            return 30*60
        } else if tiempo == "45 minutos" {
            totalTime = 45*60
            return 45*60
        } else if tiempo == "1 hora" {
            totalTime = 60*60
            return 60*60
        } else {
            totalTime = 90*60
            return 90*60
        }
    }
    
    func createTimer(tiempo: Int) {
        countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(actualizaLabelTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func didTapBack(sender: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: "Salir", message: "¿Estás seguro de que quieres salir?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Salir", style: .destructive, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(actionSheet, animated: true)
    }
    
    @objc private func didFinishTime() {let alert = UIAlertController(title: "Tiempo Fuera", message: "Se ha terminado el tiempo.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: {_ in
            let vc = ResultadosViewController()
            self.present(vc, animated: true) {
                self.navigationController?.popViewController(animated: true)
            }
        }))
        countDownTimer.invalidate()
        self.present(alert, animated: true)
    }
    
    @IBAction private func numProblemas(num: Int) {
        cardTitulo.category = "\(num) problemas"
    }
    
    // MARK: -Models
    private func configureModels() {
        problemas.append([problema(area:"Geometría", titulo: "Juanito Alcachofa va a votar", nivel: "Introductorio"), problema(area:"Teoría de Números", titulo: "Panchita compra sandías", nivel: "Introductorio"), problema(area:"Combinatoria", titulo: "Sherlock el  perro y sus amigos", nivel: "Introductorio"), problema(area:"Álgebra", titulo: "Nadia se va a dormir", nivel: "Introductorio")])
        problemas.append([problema(area:"Bonus", titulo: "Juanito Alcachofa va a votar", nivel: "Introductorio")])
    }
}



