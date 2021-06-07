//
//  ProblemaViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit
class ProblemaViewController: UIViewController {
    
    struct Problema {
        var tipoProblema:String!
        var descProblema:String!
        var nomProblema:String!
        var respProblema:String!
        var imgProblema:UIImage!
        
    }
    
    var countDownTimer: Timer!
    var totalTime: Int!
    var descripcionProblema: String!
    
    let descripcion: UILabel = {
        let descripcion = UILabel()
        descripcion.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis risus id felis pulvinar, nec pretium mi tempus. Nulla facilisi. Aliquam eget justo ut libero sagittis maximus nec sit amet lacus. Donec blandit est eget ipsum porta, ut pharetra ex tincidunt. Aenean vitae hendrerit mauris."
        return descripcion
    }()
    
    var listaProblemas = [
        Problema(tipoProblema: "Combinatoria", descProblema: "Rita camina de izquierda a derecha y va poniendo en su canasta los números que se encuentra en su camino. ¿Cuáles de los siguientes números pueden estar en su canasta?", nomProblema: "El camino de Rita", respProblema: "2, 3 y 5", imgProblema: nil), Problema(tipoProblema: "Teoría de Números", descProblema: "¿Cuántos cubitos se quitaron del primer bloque para obtener el segundo?", nomProblema: "Removiendo cubitos", respProblema: "7", imgProblema: nil), Problema(tipoProblema: "Combinatoria", descProblema: "La combinación de una caja fuerte es un número de tres cifras distintas. Si se sabe que las cifras son 1, 3 y 5 ¿Cuántas combinaciones son posibles?", nomProblema: "Combinaciones posibles", respProblema: "6", imgProblema: nil), Problema(tipoProblema: "Combinatoria", descProblema: "Después del primer silbido que da un entrenador de changos en el circo, los changos se quedan formados en 6 filas cada una con 4 changos. Después del segundo chiflido se forman 8 filas ¿Cuántos changos quedan en cada fila después del segundo silbido?", nomProblema: "Formación chango", respProblema: "3", imgProblema: nil), Problema(tipoProblema: "Combinatoria", descProblema: "Sofía dibuja canguros: uno azul, uno verde, uno rojo, uno negro, uno amarillo, uno azul, uno verde, uno rojo, etc. ¿De qué color es el 17º canguro", nomProblema: "Sofía dibuja canguros", respProblema: "Verde", imgProblema: nil)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(labelTimer)
        view.addSubview(descripcion)
        createTimer(tiempo: totalTime)
        
    }
    
    private let labelTimer: UILabel = {
        let label = UILabel()
        label.text = "--:--"
        return label
    }()
    
    override func viewDidLayoutSubviews() {
        labelTimer.frame = CGRect(x: 70, y: 70, width: view.frame.size.width - 20, height: 50)
    }
    
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
    
}
