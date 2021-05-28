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
    
    @IBAction func saveUserDefaults(_ sender: Any){
        let usuario = User(name: tfNombre.text,town: tfMunicipio.text,grade: tfGrado.text,email: tfEmail.text,highScore: 0)
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(usuario), forKey: "usuario")
        print("Usuario Guardado")
    }
    
    @IBAction func loadUserDefaults(_ sender: Any) {
        let defaults = UserDefaults.standard
        guard let userInfo = defaults.object(forKey: "user") as? Data else {
            return
        }
        guard let user = try? PropertyListDecoder().decode(User.self, from: userInfo) else {
            return
        }
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
