//
//  DescargaProblemasViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 11/06/21.
//

import UIKit

class DescargaProblemasViewController: UIViewController {
    
    let manager = FileManager.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = manager.urls(for: .documentDirectory,
                                     in: .userDomainMask).first else {
            return
        }
        print(url.path)
    }

}
