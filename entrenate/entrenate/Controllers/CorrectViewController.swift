//
//  CorrectViewController.swift
//  entrenate
//
//  Created by user186524 on 5/26/21.
//

import UIKit

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
