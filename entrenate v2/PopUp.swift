//
//  PopUp.swift
//  entrenate v2
//
//  Created by Sergio Tapia on 10/06/21.
//

import UIKit

class PopUp: UIView {
    
    fileprivate let fuenteLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Test"
        return label
    }()
    
    fileprivate let logoImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "home")
        return imageView
    }()
    
    fileprivate lazy var stack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [fuenteLabel, logoImage])
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.frame = UIScreen.main.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
