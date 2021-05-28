//
//  usersLeaderboard.swift
//  entrenate
//
//  Created by user189912 on 5/28/21.
//

import UIKit

class usersLeaderboard: NSObject {
    var username : String
    var ciudad : String
    var imagenPerfil : UIImage!
    
    init(username: String, ciudad: String, imagenPerfil: UIImage!){
        self.username = username
        self.ciudad = ciudad
        self.imagenPerfil = imagenPerfil
    }

}
