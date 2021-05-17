//
//  ViewControllerModoCompetencia.swift
//  entrenate
//
//  Created by user186524 on 5/13/21.
//

import UIKit

class ViewControllerModoCompetencia: UIViewController {
    
    @IBOutlet weak var btBgColor: UIButton!
    @IBOutlet weak var btBgColor30: UIButton!
    @IBOutlet weak var btBgColor60: UIButton!
    @IBOutlet weak var btBgColor90: UIButton!
    @IBOutlet weak var btBgColor120: UIButton!
    
    var timerMin : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btBgColor.setBackgroundImage(UIImage(named: "Vector-2"), for: .normal)
        btBgColor30.setBackgroundImage(UIImage(named: "Vector-2"), for: .normal)
        btBgColor60.setBackgroundImage(UIImage(named: "Vector-2"), for: .normal)
        btBgColor90.setBackgroundImage(UIImage(named: "Vector-2"), for: .normal)
        btBgColor120.setBackgroundImage(UIImage(named: "Vector-2"), for: .normal)
    }
    
    
    @IBAction func btTimer15(_ sender: Any) {
        let selected = UIImage(named: "Vector")
        if btBgColor.currentBackgroundImage == UIImage(named: "Vector-2") {
            btBgColor.setBackgroundImage(selected, for: .normal)
            timerMin = timerMin + 15
        }
        else {
            btBgColor.setBackgroundImage(UIImage(named: "Vector-2"), for: .normal)
            timerMin = timerMin - 15
        }
    }
    
    
    @IBAction func btTimer30(_ sender: Any) {
        let selected = UIImage(named: "Vector")
        if btBgColor30.currentBackgroundImage == UIImage(named: "Vector-2") {
            btBgColor30.setBackgroundImage(selected, for: .normal)
            timerMin = timerMin + 30
        }
        else {
            btBgColor30.setBackgroundImage(UIImage(named: "Vector-2"), for: .normal)
            timerMin = timerMin - 30
        }
    }
    
    @IBAction func btTimer60(_ sender: Any) {
        let selected = UIImage(named: "Vector")
        if btBgColor60.currentBackgroundImage == UIImage(named: "Vector-2") {
            btBgColor60.setBackgroundImage(selected, for: .normal)
            timerMin = timerMin + 60
        }
        else {
            btBgColor60.setBackgroundImage(UIImage(named: "Vector-2"), for: .normal)
            timerMin = timerMin - 60
        }
    }
    
    @IBAction func btTimer90(_ sender: Any) {
        let selected = UIImage(named: "Vector")
        if btBgColor90.currentBackgroundImage == UIImage(named: "Vector-2") {
            btBgColor90.setBackgroundImage(selected, for: .normal)
            timerMin = timerMin + 90
        }
        else {
            btBgColor90.setBackgroundImage(UIImage(named: "Vector-2"), for: .normal)
            timerMin = timerMin - 90
        }
    }
    
    @IBAction func btTimer120(_ sender: Any) {
        let selected = UIImage(named: "Vector")
        if btBgColor120.currentBackgroundImage == UIImage(named: "Vector-2") {
            btBgColor120.setBackgroundImage(selected, for: .normal)
            timerMin = timerMin + 120
        }
        else {
            btBgColor120.setBackgroundImage(UIImage(named: "Vector-2"), for: .normal)
            timerMin = timerMin - 120
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let viewSeleccion = segue.destination as! ViewControllerSeleccionProblemas
        viewSeleccion.timeSet = timerMin
        
        }
    
    @IBAction func unwindToFirstViewController(_ sender: UIStoryboardSegue) {
         // No code needed, no need to connect the IBAction explicitely
        }
    

}
