//
//  NavigationGradientViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 06/06/21.
//

import UIKit

class NavigationGradientViewController: UINavigationController {

    override func viewDidLoad() {
            super.viewDidLoad()

            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            let height = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            bounds.size.height += height
            gradient.frame = bounds
        gradient.colors = [UIColor(red: 0.60, green: 0.72, blue: 0.24, alpha: 1.00).cgColor, UIColor(red: 0.00, green: 0.50, blue: 0.22, alpha: 1.00).cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)

            if let image = getImageFrom(gradientLayer: gradient) {
                navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            }
        }

        func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
            var gradientImage:UIImage?
            UIGraphicsBeginImageContext(gradientLayer.frame.size)
            if let context = UIGraphicsGetCurrentContext() {
                gradientLayer.render(in: context)
                gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
            }
            UIGraphicsEndImageContext()
            return gradientImage
        }

}
