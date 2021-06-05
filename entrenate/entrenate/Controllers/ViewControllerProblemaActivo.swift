//
//  ViewControllerProblemaActivo.swift
//  entrenate
//
//  Created by user186524 on 5/17/21.
//

import UIKit

class ViewControllerProblemaActivo: UIViewController {
    
    struct Problema {
        var tipoProblema:String!
        var descProblema:String!
        var nomProblema:String!
        var respProblema:String!
        var imgProblema:UIImage!
        
    }
    
    var countdownTimer: Timer!
    var totalTime : Int = 60
    @IBOutlet weak var lbTimer: UILabel!
    @IBOutlet weak var lbNumProblema: UILabel!
    @IBOutlet weak var lbTipoProblema: UILabel!
    @IBOutlet weak var tvProblemaDescripcion: UITextView!
    @IBOutlet weak var lbNumProblemaIt: UILabel!
    @IBOutlet weak var lbNomProblema: UILabel!
    
    var listaProblemas = [
        Problema(tipoProblema: "Combinatoria", descProblema: "Rita camina de izquierda a derecha y va poniendo en su canasta los números que se encuentra en su camino. ¿Cuáles de los siguientes números pueden estar en su canasta?", nomProblema: "El camino de Rita", respProblema: "2, 3 y 5", imgProblema: nil), Problema(tipoProblema: "Teoría de Números", descProblema: "¿Cuántos cubitos se quitaron del primer bloque para obtener el segundo?", nomProblema: "Removiendo cubitos", respProblema: "7", imgProblema: nil), Problema(tipoProblema: "Combinatoria", descProblema: "La combinación de una caja fuerte es un número de tres cifras distintas. Si se sabe que las cifras son 1, 3 y 5 ¿Cuántas combinaciones son posibles?", nomProblema: "Combinaciones posibles", respProblema: "6", imgProblema: nil), Problema(tipoProblema: "Combinatoria", descProblema: "Después del primer silbido que da un entrenador de changos en el circo, los changos se quedan formados en 6 filas cada una con 4 changos. Después del segundo chiflido se forman 8 filas ¿Cuántos changos quedan en cada fila después del segundo silbido?", nomProblema: "Formación chango", respProblema: "3", imgProblema: nil), Problema(tipoProblema: "Combinatoria", descProblema: "Sofía dibuja canguros: uno azul, uno verde, uno rojo, uno negro, uno amarillo, uno azul, uno verde, uno rojo, etc. ¿De qué color es el 17º canguro", nomProblema: "Sofía dibuja canguros", respProblema: "Verde", imgProblema: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomInt = Int.random(in: 0 ...  listaProblemas.count - 1)
        lbTipoProblema.text = listaProblemas[randomInt].tipoProblema
        lbNomProblema.text = listaProblemas[randomInt].nomProblema
        tvProblemaDescripcion.text = listaProblemas[randomInt].descProblema
        startTimer()
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
    
    func startTimer() {
            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
    
    @objc func updateTime() {
        lbTimer.text = "\(timeFormatted(totalTime))"

            if totalTime != 0 {
                totalTime -= 1
            } else {
                endTimer()
            }
        }
    
    func endTimer() {
            countdownTimer.invalidate()
        }

        func timeFormatted(_ totalSeconds: Int) -> String {
            let seconds: Int = totalSeconds % 60
            let minutes: Int = (totalSeconds / 60) % 60
            let hours: Int = totalSeconds / 3600
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
