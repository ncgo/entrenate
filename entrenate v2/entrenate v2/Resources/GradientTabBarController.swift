//
//  GradientTabBarController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 05/06/21.
//

import UIKit

class GradientTabBarController: UITabBarController {

        let gradientlayer = CAGradientLayer()

        override func viewDidLoad() {
            super.viewDidLoad()
            setGradientBackground(colorOne: UIColor(red: 0.00, green: 0.50, blue: 0.22, alpha: 1.00), colorTwo: UIColor(red: 0.60, green: 0.72, blue: 0.24, alpha: 1.00))
        }

        func setGradientBackground(colorOne: UIColor, colorTwo: UIColor)  {
            gradientlayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
            gradientlayer.colors = [colorOne.cgColor, colorTwo.cgColor]
            gradientlayer.locations = [0, 1]
            gradientlayer.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.0)
            self.tabBar.layer.insertSublayer(gradientlayer, at: 0)
        }
}
