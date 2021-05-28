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
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
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
