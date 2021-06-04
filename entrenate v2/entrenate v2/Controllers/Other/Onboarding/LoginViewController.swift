//
//  LoginViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct Constantes {
        static let cornerRadius: CGFloat = 8.0
        static let verdeOmmch = UIColor(red: 0, green: 128, blue: 55, alpha: 1.00)
    }
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Nombre de usuario o Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constantes.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Contraseña"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constantes.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    private let btLogin: UIButton = {
        let boton = UIButton()
        boton.setTitle("Inicia Sesión", for: .normal)
        boton.layer.masksToBounds = true
        boton.layer.cornerRadius = Constantes.cornerRadius
        boton.backgroundColor = Constantes.verdeOmmch
        boton.setTitleColor(.white, for: .normal)
        return boton
    }()
    
    private let btRegistro: UIButton = {
        let boton = UIButton()
        boton.setTitle("Regístrate", for: .normal)
        boton.layer.masksToBounds = true
        boton.layer.cornerRadius = Constantes.cornerRadius
        boton.backgroundColor = Constantes.verdeOmmch
        boton.setTitleColor(.white, for: .normal)
        return boton
    }()
    
    private let headerView: UIView = {
        return UIView()
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //Assign frames
        headerView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width , height: 200)
        
    }
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(btLogin)
        view.addSubview(btRegistro)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLogin() {}
    @objc private func didTapRegister() {}
    

}
