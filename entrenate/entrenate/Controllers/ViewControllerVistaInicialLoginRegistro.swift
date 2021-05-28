//
//  ViewControllerVistaInicialLoginRegistro.swift
//  entrenate
//
//  Created by Nadia Garcia on 17/05/21.
//

import UIKit
import Firebase
class ViewControllerVistaInicialLoginRegistro: UIViewController{

    
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var btRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btInicioSesion(_ sender: UIButton) {
        
        print("Inicio de sesión tapped")
    }
    
    @IBAction func htRegistroUsuario(_ sender: UIButton) {
        print("Registrarse tapped")
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

