//
//  SeleccionProblemasViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit
import Cards

protocol UpdateCelda {
    func updateCelda(status: String, index: IndexPath)
}

class SeleccionProblemasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = UserDefaults.standard
    
    struct Sesion {
        let dateSesion: Date = Date()
        let numProblems: Int = Int()
        let timeSelected: String = String()
        let timeActual: Timer = Timer()
        let problemas = [String]()
        let nivel: Int = Int()
        let resultadosFinales = resultados()
    }
    
    
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var problemas = [Problema]()
    var sesion = Sesion()
    let label = "label"
    
    struct resultados {
        var correctos: Int = 0
        var intentados: Int = 0
        var noIntentados: Int = 0
    }
    var resultadosSesion = resultados()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cantidadProblemas
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print("whack \(indexPath.row)")
        print(problemas[indexPath.row].area)
        cell.textLabel?.text = problemas[indexPath.row].area
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProblemaViewController()
        vc.totalTime = totalTime
        vc.descripcionProblema = problemas[indexPath.row].descripcion
        vc.areaProblema = problemas[indexPath.row].area
        vc.respuestaProblema = problemas[indexPath.row].respuesta
        vc.fuente = problemas[indexPath.row].respuesta
        vc.puntosAgregar = puntosPorProblema
        vc.tituloProblema = problemas[indexPath.row].titulo
        vc.puntosAcumulados = puntosAcumulados
        vc.indexPath = indexPath
        vc.delegate = self
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    
    var tiempoSeleccionado: String = "0"
    var cantidadProblemas: Int = 12
    var puntosAcumulados: Int!
    var countDownTimer: Timer!
    var puntosPorProblema: Int = 500
    var nivelUsuario: Int = 0
    var nivelProblema: String = "Introductorio"
    
    
    private let cardTitulo: CardArticle = {
        let card = CardArticle()
        card.category = "problemas"
        card.title = "COMPETENCIA"
        card.backgroundImage = UIImage(named: "fondo gradiente amarillo opacity")
        card.subtitle = "puntos acumulados"
        card.textColor = .white
        return card
    }()
    
    private let labelTimer: UIButton = {
        let button = UIButton()
        button.setTitle("--:--", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        print("El tiempo para esta sesion es de \(tiempoSeleccionado)")
        print("Responder??s \(String(cantidadProblemas)) problemas")
        numProblemas(num: cantidadProblemas)
        resultadosSesion.noIntentados = cantidadProblemas
        cardTitulo.subtitle = "Puntos Acumulados \(defaults.string(forKey: "PuntosAcumulados")!)"
        let newBackButton = UIBarButtonItem(title: "Terminar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapBack))
        newBackButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = newBackButton
        view.addSubview(cardTitulo)
        createTimer(tiempo: Int(getSeconds(tiempo: tiempoSeleccionado)))
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(labelTimer)
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cardTitulo.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 20, width: view.frame.size.width - 20, height: view.frame.size.height/6)
        labelTimer.frame = CGRect(x: 0, y: view.bottom - 150, width: view.frame.size.width, height: 50)
        tableView.frame = CGRect(x: 10, y: cardTitulo.bottom + 20, width: view.frame.size.width - 20, height: view.frame.size.height/2)
    }
    
    var totalTime: Int!
    
    @objc func actualizaLabelTimer() {
        labelTimer.setTitle("\(timeFormatted(totalTime))", for: .normal)
        if totalTime != 0 {
            totalTime -= 1
        }
        else {
            didFinishTime()
        }
        
        if totalTime > 120 && totalTime < 300{
            labelTimer.backgroundColor = .systemYellow
        } else if totalTime < 120 {
            labelTimer.backgroundColor = .systemRed
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
        let actionSheet = UIAlertController(title: "Salir", message: "??Est??s seguro de que quieres salir?", preferredStyle: .actionSheet)
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
    
    
    private func logSesion() {
        // DatabaseManager.shared.
    }
    
    
    private func initializeSession() {
        // let hora
    }
    
    func finish() {
        if resultadosSesion.correctos == cantidadProblemas {
            let alert = UIAlertController(title: "Has terminado", message: "Has contestado correctamente todos los problemas.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: {_ in
                    let vc = ResultadosViewController()
                    self.present(vc, animated: true) {
                        self.navigationController?.popViewController(animated: true)
                    }
                }))
                countDownTimer.invalidate()
                logSesion()
                self.present(alert, animated: true)
        }
    }
    
}

extension SeleccionProblemasViewController: UpdateCelda {
    
    @IBAction func updateCelda(status: String, index: IndexPath) {
        print("updating")
        if (status == "Correcto") {
            resultadosSesion.correctos += 1
            resultadosSesion.noIntentados -= 1
            tableView.cellForRow(at: index)?.backgroundColor = .systemGreen
        } else if (status == "Incorrecto") {
            tableView.cellForRow(at: index)?.backgroundColor = .systemRed
        } else {
            tableView.cellForRow(at: index)?.backgroundColor = .systemGray5
        }
        
        cardTitulo.subtitle = "Puntos Acumulados \(defaults.string(forKey: "PuntosAcumulados")!)"
        print(resultadosSesion.correctos, " ", resultadosSesion.noIntentados)
        finish()
    }
}


