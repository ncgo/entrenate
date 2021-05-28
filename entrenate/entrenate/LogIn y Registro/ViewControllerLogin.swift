//
//  ViewControllerLogin.swift
//  entrenate
//
//  Created by Nadia Garcia on 17/05/21.
//

import UIKit

class ViewControllerLogin: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var btRegistro: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToFirstViewController(_ sender: UIStoryboardSegue) {
         // No code needed, no need to connect the IBAction explicitely
        }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        if tfPassword.text! == "" {
            return false
        }
        return true
    }
    
    @IBAction func loadUserDefaults(_ sender: Any) {
        let defaults = UserDefaults.standard
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
