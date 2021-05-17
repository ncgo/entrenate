//
//  ViewController.swift
//  entrenate
//
//  Created by Nadia Garcia on 18/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var tfContrasena: UITextField!
    var email: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        if tfContrasena.text! == "" {
            return false
        }
        return true
    }
    
    @IBAction func btIniciaSesion(_ sender: Any) {
        if isValidEmail(tfUsuario.text!) == true && isValidPassword(tfContrasena.text!){
            
        }
        else {
            let alerta = UIAlertController(title: "Error", message: "Los campos deben estar llenos y el formato de correo debe ser correcta", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
        }
    }
    
    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }

}

