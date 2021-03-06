//
//  RegisterViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var etapaEducativa = ["Primaria", "Secundaria", "Preparatoria"]
    var gradosPrimaria = ["Primer Grado", "Segundo Grado", "Tercer Grado", "Cuarto Grado", "Quinto Grado", "Sexto Grado"]
    var gradosSecundaria = ["Primer Grado", "Segundo Grado", "Tercer Grado"]
    var semestresPrepa = ["Primer Semestre", "Segundo Semestre", "Tercer Semestre", "Cuarto Semestre", "Quinto Semestre", "Sexto Semestre"]
    var Ciudades = ["Ciudad Juárez", "Chihuahua", "Cuauhtémoc", "Delicias", "Saucillo", "Camargo", "Parral", "Otra"]
    
    var etapa: String = "Primaria"
    var gradoEtapa: String = "Primer Grado"
    var Ciudad: String = "Ciudad Juárez"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == pickerCiudad {
            return 1
        }
        else {
            return 2
        }
    }
    
    var activeTextField : UITextField? = nil
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerNivelEducativo {
            if component == 0 {
                return etapaEducativa.count
            } else {
                let opcionSleccionada = pickerView.selectedRow(inComponent: 0)
                if opcionSleccionada == 0 {
                    return gradosPrimaria.count
                } else if opcionSleccionada == 1 {
                    return gradosSecundaria.count
                } else {
                    return semestresPrepa.count
                }
            }
        } else if pickerView == pickerCiudad {
            if component == 0 {
                return Ciudades.count
            }
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerCiudad {
            if component == 0 {
                return Ciudades[row]
            }
        }
        else if pickerView == pickerNivelEducativo {
            if component == 0 {
                return etapaEducativa[row]
            } else {
                let opcionSeleccionada = pickerView.selectedRow(inComponent: 0)
                if opcionSeleccionada == 0 {
                    return gradosPrimaria[row]
                } else if opcionSeleccionada == 1 {
                    return gradosSecundaria[row]
                } else {
                    return semestresPrepa[row]
                }
            }
        }
        return String(0)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerCiudad {
            pickerView.reloadComponent(0)
            let opcionSeleccionada = pickerView.selectedRow(inComponent: 0)
            let ciudadSeleccionada = Ciudades[opcionSeleccionada]
            Ciudad = ciudadSeleccionada
        }
        else if pickerView == pickerNivelEducativo {
            pickerView.reloadComponent(1)
            let opcionSeleccionada = pickerView.selectedRow(inComponent: 0)
            let listaElementoSeleccionado = pickerView.selectedRow(inComponent: 1)
            let nivelEducativo = etapaEducativa[opcionSeleccionada]
            let listaElemento: String
            
            if opcionSeleccionada == 0 {
                listaElemento = gradosPrimaria[listaElementoSeleccionado]
            }else if opcionSeleccionada == 1 {
                listaElemento = gradosSecundaria[listaElementoSeleccionado]
            }else {
                listaElemento = semestresPrepa[listaElementoSeleccionado]
            }
            etapa = nivelEducativo
            gradoEtapa = listaElemento
        }
    }
    
    let pickerCiudad: UIPickerView = {
       let field = UIPickerView()
        
        return field
    }()
    
    let pickerNivelEducativo: UIPickerView = {
       let field = UIPickerView()
        
        return field
    }()
    
    struct Constantes {
        static let cornerRadius: CGFloat = 8.0
        static let verdeOmmch = UIColor(red: 0, green: 0.50, blue: 0.22, alpha: 1.00)
    }
    
    private let nameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Nombre completo"
        field.textContentType = .username
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
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Nombre de usuario"
        field.textContentType = .username
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
        field.keyboardType = .emailAddress
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
        field.textContentType = .newPassword
        field.placeholder = "Contraseña (Mínimo 8 carácteres)"
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
        
        let descriptor = """
        required: upper; required: lower; required: digit; minlength: 8;
        """
        let rules = UITextInputPasswordRules(descriptor: descriptor)
        field.passwordRules = rules
        
        return field
    }()
    
    private let escuelaField: UITextField = {
        let field = UITextField()
        field.placeholder = "Escuela"
        field.keyboardType = .emailAddress
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
        view.addSubview(nameField)
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(btRegistro)
        view.addSubview(pickerCiudad)
        view.addSubview(pickerNivelEducativo)
        view.addSubview(escuelaField)
        view.backgroundColor = .systemBackground
        btRegistro.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        self.pickerCiudad.delegate = self
        self.pickerCiudad.dataSource = self
        self.pickerNivelEducativo.delegate = self
        self.pickerNivelEducativo.dataSource = self
        escuelaField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
        
        var shouldMoveViewUp = false

          // if active text field is not nil
          if let activeTextField = activeTextField {

            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            
            let topOfKeyboard = self.view.frame.height - keyboardSize.height

            // if the bottom of Textfield is below the top of keyboard, move up
            if bottomOfTextField > topOfKeyboard {
              shouldMoveViewUp = true
            }
          }

          if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
          }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(x: 0, y: 0.0, width: view.width , height: view.height/6.0)
        nameField.frame = CGRect(x: 20, y: headerView.bottom + 20, width: view.width - 40, height: 52)
        usernameField.frame = CGRect(x: 20, y: nameField.bottom + 20, width: view.width - 40, height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom + 15, width: view.width - 40, height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 15, width: view.width - 40, height: 52)
        pickerCiudad.frame = CGRect(x: 20, y: passwordField.bottom + 20, width: view.width - 40, height: 52)
        pickerNivelEducativo.frame = CGRect(x: 20, y: pickerCiudad.bottom + 20, width: view.width - 40, height: 52)
        escuelaField.frame = CGRect(x: 20, y: pickerNivelEducativo.bottom + 15, width: view.width - 40, height: 52)
        btRegistro.frame = CGRect(x: 20, y: escuelaField.bottom + 20, width: view.width - 40, height: 52)
        configureHeaderView()
    }
    
    @objc private func didTapRegister() {
        nameField.resignFirstResponder()
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        pickerCiudad.resignFirstResponder()
        pickerNivelEducativo.resignFirstResponder()
        escuelaField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8,
              let name = nameField.text, !name.isEmpty,
                   let username = usernameField.text, !username.isEmpty, let escuela = escuelaField.text, !escuela.isEmpty else {
                    let alert = UIAlertController(title: "Error en registro de cuenta", message: "Revisa tus datos y por favor intenta de nuevo.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
            return
        }
        
        AuthManager.shared.registerNewUser(name: name, username: username, email: email, password: password, Ciudad: Ciudad, nivelEducativo: etapa, gradoEtapa: gradoEtapa, escuela: escuela) { registered in

            DispatchQueue.main.async {
                if registered {
                    // good to go
                    let alert = UIAlertController(title: "Registro de cuenta exitoso", message: "Procede a iniciar sesión.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {_ in 
                        self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true)
                }
                else {
                    // something failed
                }
            }
        }
    }
}


extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField{
            usernameField.becomeFirstResponder()
        }
        else if textField == usernameField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            escuelaField.becomeFirstResponder()
        }else {
            didTapRegister()
        }
        return true
    }
}
