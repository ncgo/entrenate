//
//  ViewControllerHome.swift
//  entrenate
//
//  Created by Nadia Garcia on 28/05/21.
//

import FirebaseAuth
import UIKit

class ViewControllerHome: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }
    
    private func handleNotAuthenticated() {
        //Check auth status
        if Auth.auth().currentUser == nil {
            //Show login
            let loginVC = ViewControllerIniciaSesion()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
        
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
