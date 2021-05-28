//
//  ViewControllerIniciaSesion.swift
//  entrenate
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewControllerIniciaSesion: UIViewController {

    @IBOutlet weak var signInButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // addSubviews()
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    /*
    private let usernameEmailField: UITextField = {
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
        return UIButton()
    }()
    
    private let terminosYCondiciones: UIButton = {
        return UIButton()
    }()
    
    private let politicaPrivacidad: UIButton = {
        return UIButton()
    }()
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //assign frames
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(terminosYCondiciones)
        view.addSubview(politicaPrivacidad)
        view.addSubview(usernameEmailField)
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
