//
//  ProblemaViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit
import SAConfettiView

class ProblemaViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var problemInfo = "Book, Year"
    
    var countDownTimer: Timer!
    var totalTime: Int!
    var descripcionProblema: String!
    var tituloProblema: String!
    var areaProblema: String!
    var respuestaProblema: String!
    var fuente: String!
    var puntos: Int!
    var puntosAcumulados: Int!
    let color: UIColor = .systemBlue
    var index: Int!
    
    let confettiView = SAConfettiView()
    
    let titulo: UILabel = {
        let titulo = UILabel()
        titulo.text = "Titulo Divertido"
        titulo.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titulo.textColor = .systemBlue
        titulo.textAlignment = .center
        return titulo
    }()
    
    let botonInfo: UIButton = {
        let boton = UIButton()
        boton.setImage(UIImage(systemName: "info"), for: .normal)
        boton.layer.masksToBounds = true
        boton.backgroundColor = .systemBlue
        boton.layer.cornerRadius = 25
        return boton
    }()
    
    let areaLabel : UILabel = {
       let label = UILabel()
        label.text = "Teoria de Numeros"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    
    let respuestaInput: UITextField = {
       let field = UITextField()
        field.placeholder = "Ingresa tu respuesta"
        field.keyboardType = .numberPad
        field.returnKeyType = .done
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 8.0
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor(red: 0.24, green: 0.57, blue: 0.90, alpha: 1.00).cgColor
        return field
    }()
    
    let botonEnviar: UIButton = {
        let boton = UIButton()
        boton.backgroundColor = .systemBlue
        boton.setTitle("Enviar", for: .normal)
        boton.tintColor = .white
        boton.layer.masksToBounds = true
        boton.layer.cornerRadius = 8.0
        return boton
    }()
    
    let descripcion: UILabel = {
        let descripcion = UILabel()
        descripcion.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis risus id felis pulvinar, nec pretium mi tempus. Nulla facilisi. Aliquam eget justo ut libero sagittis maximus nec sit amet lacus. Donec blandit est eget ipsum porta, ut pharetra ex tincidunt. Aenean vitae hendrerit mauris."
        descripcion.textAlignment = .center
        descripcion.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        descripcion.numberOfLines = 0
        return descripcion
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        areaLabel.text = areaProblema
        titulo.text = tituloProblema
        descripcion.text = descripcionProblema
        view.addSubview(labelTimer)
        view.addSubview(descripcion)
        view.addSubview(botonInfo)
        view.addSubview(botonEnviar)
        view.addSubview(titulo)
        view.addSubview(respuestaInput)
        view.addSubview(areaLabel)
        print(respuestaProblema!)
        botonEnviar.addTarget(self, action: #selector(didTapEnviar), for: .touchUpInside)
        botonInfo.addTarget(self, action: #selector(didTapInfo), for: .touchUpInside)
        createTimer(tiempo: totalTime)
        view.backgroundColor = .systemBackground
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoCambia), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoCambia), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoCambia), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    private let labelTimer: UIButton = {
        let button = UIButton()
        button.setTitle("--:--", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        labelTimer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50)
        titulo.frame = CGRect(x: 10, y: 1*view.frame.size.height/4, width: view.frame.size.width - 20, height: 30)
        areaLabel.frame = CGRect(x: 10, y: titulo.bottom + 5, width: view.frame.size.width - 20, height: 20)
        descripcion.frame = CGRect(x: 20, y: 3*view.frame.size.height/8 , width: view.frame.size.width - 40, height: view.frame.size.height/4)
        botonInfo.frame = CGRect(x: view.frame.size.width/2 - 20, y: 7*view.frame.size.height/8, width: 40, height: 40)
        respuestaInput.frame = CGRect(x: view.frame.size.width/4, y: descripcion.bottom + 25, width: view.frame.size.width/2, height: 50)
        botonEnviar.frame = CGRect(x: view.frame.size.width/3, y: respuestaInput.bottom + 10, width: view.frame.size.width/3, height: 50)
    }
    
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
    
    func createTimer(tiempo: Int) {
        countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(actualizaLabelTimer), userInfo: nil, repeats: true)
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
    
    @objc private func didTapEnviar() {
        checkAnswer(respuestaRecibida: respuestaInput.text!, respuestaCorrecta: respuestaProblema)
    }
    
    private func checkAnswer(respuestaRecibida: String, respuestaCorrecta: String) {
        var puntosUsuario: Int!
        if let puntosAcumulados = defaults.string(forKey: "PuntosAcumulados"){
            puntosUsuario = Int(puntosAcumulados)!
        }
        if respuestaRecibida == respuestaCorrecta {
            configConfetti()
            puntosUsuario += 100
            defaults.setValue(puntosUsuario, forKey: "PuntosAcumulados")
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false, block: {_ in
                self.dismiss(animated: true, completion: nil)
            })
            
        } else {
            if puntosUsuario >= 100 {
                puntosUsuario -= 100
                defaults.setValue(puntosUsuario, forKey: "PuntosAcumulados")
            } else {}
        }
       
    }
    
    func configConfetti(){
        self.view.addSubview(confettiView)
        confettiView.frame = self.view.bounds
        confettiView.intensity = 0.75
        confettiView.startConfetti()
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {_ in
            self.confettiView.stopConfetti()
        })
        
    }
    
    @objc private func didTapInfo() {
        let info = PopUp()
        info.fuenteLabel.text = problemInfo
        view.addSubview(info)
    }
    
    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }
    
    @objc func tecladoCambia(notification: Notification) {
        print("Teclado aparece: \(notification.name.rawValue)")
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -keyboardRect.height
        }
        else {
            view.frame.origin.y = 0
        }
        
    }
    
}
