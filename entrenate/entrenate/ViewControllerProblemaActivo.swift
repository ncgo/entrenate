//
//  ViewControllerProblemaActivo.swift
//  entrenate
//
//  Created by user186524 on 5/17/21.
//

import UIKit

class ViewControllerProblemaActivo: UIViewController {
    
    var countdownTimer: Timer!
    var totalTime : Int = 60
    @IBOutlet weak var lbTimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startTimer()
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
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
            //     let hours: Int = totalSeconds / 3600
            return String(format: "%02d:%02d", minutes, seconds)
        }
    
    @IBAction func quitaTeclado() {
        view.endEditing(true)
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
