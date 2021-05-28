//
//  CorrectViewController.swift
//  entrenate
//
//  Created by user186524 on 5/26/21.
//

import UIKit

struct Problema {
    var tipoProblema:String!
    var descProblema:String!
    var nomProblema:String!
    var respProblema:String!
    var imgProblema:UIImage!
    
}

var numProblema:Int = 1

var listaProblemas = [
    Problema(tipoProblema: "Combinatoria", descProblema: "Rita camina de izquierda a derecha y va poniendo en su canasta los números que se encuentra en su camino. ¿Cuáles de los siguientes números pueden estar en su canasta?", nomProblema: "El camino de Rita", respProblema: "2, 3 y 5", imgProblema: nil), Problema(tipoProblema: "Teoría de Números", descProblema: "¿Cuántos cubitos se quitaron del primer bloque para obtener el segundo?", nomProblema: "Removiendo cubitos", respProblema: "7", imgProblema: nil), Problema(tipoProblema: "Combinatoria", descProblema: "La combinación de una caja fuerte es un número de tres cifras distintas. Si se sabe que las cifras son 1, 3 y 5 ¿Cuántas combinaciones son posibles?", nomProblema: "Combinaciones posibles", respProblema: "6", imgProblema: nil), Problema(tipoProblema: "Combinatoria", descProblema: "Después del primer silbido que da un entrenador de changos en el circo, los changos se quedan formados en 6 filas cada una con 4 changos. Después del segundo chiflido se forman 8 filas ¿Cuántos changos quedan en cada fila después del segundo silbido?", nomProblema: "Formación chango", respProblema: "3", imgProblema: nil), Problema(tipoProblema: "Combinatoria", descProblema: "Sofía dibuja canguros: uno azul, uno verde, uno rojo, uno negro, uno amarillo, uno azul, uno verde, uno rojo, etc. ¿De qué color es el 17º canguro", nomProblema: "Sofía dibuja canguros", respProblema: "Verde", imgProblema: nil)
]

class CorrectViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    var progressBarTimer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 8)
        progressView.layer.cornerRadius = 10
                progressView.clipsToBounds = true
                progressView.layer.sublayers![1].cornerRadius = 10
                progressView.subviews[1].clipsToBounds = true
        progressView.progress = 0.0
        timeStart()
    }
    
    func timeStart(){
        progressView.progress = 0.0
                self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(CorrectViewController.updateProgressView), userInfo: nil, repeats: true)
    }
    
    @objc func updateProgressView(){
            progressView.progress += 0.2
            progressView.setProgress(progressView.progress, animated: true)
            if(progressView.progress == 1.0)
            {
                progressBarTimer.invalidate()
                self.dismiss(animated: true, completion: nil)
            }
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "problema-activo" {
            let viewProblema = segue.destination as! ViewControllerProblemaActivo
            let randomInt = Int.random(in: 0 ...  listaProblemas.count - 1)
            viewProblema.lbNomProblema.text = listaProblemas[randomInt].nomProblema
            viewProblema.lbTipoProblema.text = listaProblemas[randomInt].tipoProblema
            viewProblema.tvProblemaDescripcion.text = listaProblemas[randomInt].descProblema
            numProblema += 1
            viewProblema.lbNumProblemaIt.text = String(numProblema)
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
