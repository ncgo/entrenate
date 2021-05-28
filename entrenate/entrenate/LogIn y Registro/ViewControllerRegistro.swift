//
//  ViewControllerRegistro.swift
//  entrenate
//
//  Created by Nadia Garcia on 17/05/21.
//

import UIKit

class ViewControllerRegistro: UIViewController {
    
    struct User : Codable {
        var name: String!
        var town: String!
        var grade: String!
        var email: String!
        var password: String!
        var highScore: Int!
    }

    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfMunicipio: UITextField!
    @IBOutlet weak var tfGrado: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btRegistro: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveUserDefaults(_ sender: Any){
        let usuario = User(name: tfNombre.text,town: tfMunicipio.text,grade: tfGrado.text,email: tfEmail.text,highScore: 0)
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(usuario), forKey: "usuario")
        print("Usuario Guardado")
    }
    
    @IBAction func GuardarInfo(_ sender: Any) {
        saveUserDefaults((Any).self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login-registrate" {
            let viewLogin = segue.destination as! ViewControllerLogin
            viewLogin.tfEmail = tfEmail
            viewLogin.tfPassword = tfPassword
        }
    }

}
