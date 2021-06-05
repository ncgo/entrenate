//
//  RegisterViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit

class RegisterViewController: UIViewController {
    struct Constantes {
        static let cornerRadius: CGFloat = 8.0
        static let verdeOmmch = UIColor(red: 0, green: 0.50, blue: 0.22, alpha: 1.00)
    }
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Nombre de usuario"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constantes.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = Constantes.verdeOmmch.cgColor
        return field
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Dirección de correo electrónico"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constantes.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = Constantes.verdeOmmch.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Contraseña"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constantes.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = Constantes.verdeOmmch.cgColor
        return field
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
        let header = UIView()
        header.backgroundColor = Constantes.verdeOmmch
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "fondo"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        // Add logo
        let imageView = UIImageView(image: UIImage(named: "logo amarillo"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/6.0, y: headerView.top + headerView.height/2, width: headerView.width*2/3, height: headerView.height/2.5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(btRegistro)
        view.backgroundColor = .systemBackground
        btRegistro.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(x: 0, y: 0.0, width: view.width , height: view.height/6.0)
        usernameField.frame = CGRect(x: 20, y: headerView.bottom + 20, width: view.width - 40, height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom + 15, width: view.width - 40, height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 15, width: view.width - 40, height: 52)
        btRegistro.frame = CGRect(x: 20, y: passwordField.bottom + 20, width: view.width - 40, height: 52)
        configureHeaderView()
    }
    
    @objc private func didTapRegister() {
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8,
                   let username = usernameField.text, !username.isEmpty else {
            return
        }
        
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { registered in
            DispatchQueue.main.async {
                if registered {
                    // good to go
                }
                else {
                    // something failed
                }
            }
        }
    }
}



extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            didTapRegister()
        }
        return true
    }
}
