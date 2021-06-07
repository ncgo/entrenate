//
//  ProblemaViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit

class ProblemaViewController: UIViewController {
    
    var countDownTimer: Timer!
    var totalTime: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(labelTimer)
        createTimer(tiempo: totalTime)
        view.backgroundColor = .systemTeal
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
