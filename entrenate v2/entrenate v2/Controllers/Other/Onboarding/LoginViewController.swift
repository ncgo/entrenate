//
//  LoginViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//
import SafariServices
import TransitionButton
import Firebase
import UIKit

class LoginViewController: UIViewController {
    
    let manager = FileManager.default
    
    struct Constantes {
        static let cornerRadius: CGFloat = 8.0
        static let verdeOmmch = UIColor(red: 0, green: 0.50, blue: 0.22, alpha: 1.00)
    }
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
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
    
    private let btLogin: TransitionButton = {
        let boton = TransitionButton()
        boton.setTitle("Inicia Sesión", for: .normal)
        boton.layer.masksToBounds = true
        boton.layer.cornerRadius = Constantes.cornerRadius
        boton.backgroundColor = Constantes.verdeOmmch
        boton.setTitleColor(.white, for: .normal)
        boton.spinnerColor = .white
        return boton
    }()
    
    private let lbO: UILabel = {
        let label = UILabel()
        label.text = "o"
        label.textColor = .secondaryLabel
        return label
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
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Términos del Servicio", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Política de Privacidad", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btLogin.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        btRegistro.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        view.backgroundColor = .systemBackground
        usernameEmailField.delegate = self
        passwordField.delegate = self
        addSubviews()
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoCambia), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoCambia), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoCambia), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        // Do any additional setup after loading the view.
        
        guard let url = manager.urls(for: .documentDirectory,
                                     in: .userDomainMask).first else {
            return
        }
        print(url.path)
        
        let folderProblemas = url.appendingPathComponent("problemas")
        do {
            try manager.createDirectory(at: folderProblemas, withIntermediateDirectories: true, attributes: [:])
            let fileURL = folderProblemas.appendingPathComponent("problemas.txt")
            manager.createFile(atPath: fileURL.path, contents: nil, attributes: [FileAttributeKey.creationDate: Date()])
        } catch {
            print(error)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //Assign frames
        headerView.frame = CGRect(x: 0, y: 0.0, width: view.width , height: view.height/2.0)
        usernameEmailField.frame = CGRect(x: 25, y: headerView.bottom + 15, width: view.width - 50 , height: 52)
        passwordField.frame = CGRect(x: 25, y: usernameEmailField.bottom + 10, width: view.width - 50 , height: 52)
        btLogin.frame = CGRect(x: 25, y: passwordField.bottom + 10, width: view.width - 50 , height: 55)
        lbO.frame = CGRect(x: view.width/2.0 - 10, y: btLogin.bottom + 10, width: 10 , height: 20)
        btRegistro.frame = CGRect(x: 25, y: lbO.bottom + 10, width: view.width - 50 , height: 55)
        termsButton.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom - 60, width: view.width - 20, height: 30)
        privacyButton.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom - 30, width: view.width - 20, height: 30)
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        // Add logo
        let imageView = UIImageView(image: UIImage(named: "logo slogan"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/6.0, y: view.safeAreaInsets.top, width: headerView.width*2/3, height: headerView.height - view.safeAreaInsets.top)
    }
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(btLogin)
        view.addSubview(btRegistro)
        view.addSubview(headerView)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(lbO)
    }
    
    @objc private func didTapLogin() {
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        btLogin.startAnimation()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
                return
        }
        
        var username: String?
        var email: String?
        //Login functionality
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            email = usernameEmail
        } else {
            username = usernameEmail
        }
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    // user logged in
                    self.updateUserDefaults(email: email!)
                    self.dismiss(animated: true, completion: nil)
                } else {
                    // error occurredDispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    self.btLogin.stopAnimation(animationStyle: .shake, revertAfterDelay: 1) {
                        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                            let alert = UIAlertController(title: "Error de Inicio de Sesión", message: "No se pudo Iniciar Sesión.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
                            self.present(alert, animated: true)
                        }
                    }
                }
            }
        }
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "Crea una cuenta"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string:"https://www.facebook.com/ommch") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapTermsButton() {
        guard let url = URL(string:"https://www.facebook.com/ommch") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    private func updateUserDefaults(email: String) {
        let defaults = UserDefaults.standard
        let dbKey = email.safeDatabaseKey()
        defaults.set(dbKey, forKey: "dbKey")
        DatabaseManager.shared.readUserData(dbKey: dbKey)
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            didTapLogin()
        }
        return true
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
    
}
