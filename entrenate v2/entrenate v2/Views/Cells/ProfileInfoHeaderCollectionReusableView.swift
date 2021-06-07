//
//  ProfileInfoHeaderCollectionReusableView.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 05/06/21.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    
    private let profilePictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGreen
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@username"
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nombre".uppercased()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 1
        
        return label
    }()
    
    private let ciudadLabel:UILabel = {
        let label = UILabel()
        label.text = "Ciudad"
        label.numberOfLines = 1
        return label
    }()
    
    private let escuelaLabel:UILabel = {
        let label = UILabel()
        label.text = "Escuela"
        label.numberOfLines = 1
        return label
    }()
    
    private let experiencePointsLabel: UILabel = {
        let label = UILabel()
        label.text = "XP Points"
        return label
    }()
    
    private let nivelLabel: UILabel = {
        let label = UILabel()
        label.text = "Nivel" //En Juego
        return label
    }()
    
    private let nivelValorLabel: UILabel = {
        let label = UILabel()
        label.text = "1" //En Juego
        label.textAlignment = .center
        return label
    }()
    
    private let categoriaLabel: UILabel = {
        let label = UILabel()
        label.text = "Categoria" // En Juego
        return label
    }()
    
    private let biografiaLabel: UILabel = {
        let label = UILabel()
        label.text = "Biografia"
        label.numberOfLines = 0 //Line Wrap
        label.textAlignment = .center
        return label
    }()
    
    private let puntosProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.5
        return progressView
    }()
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .systemBackground
        clipsToBounds =  true
    }
    
    private func addSubviews() {
        addSubview(profilePictureImageView)
        addSubview(usernameLabel)
        addSubview(ciudadLabel)
        addSubview(experiencePointsLabel)
        addSubview(nivelLabel)
        addSubview(categoriaLabel)
        addSubview(biografiaLabel)
        addSubview(nameLabel)
        addSubview(escuelaLabel)
        addSubview(puntosProgressView)
        addSubview(nivelValorLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profilePictureImageView.frame = CGRect(x: width/8, y: safeAreaInsets.top + 20, width: width/4, height: width/4).integral
        nameLabel.frame = CGRect(x: profilePictureImageView.right + 10, y: (profilePictureImageView.height - 60)/2, width: width/2, height: 25).integral
        usernameLabel.frame = CGRect(x: profilePictureImageView.right + 10, y: nameLabel.bottom, width: width/2, height: 20).integral
        escuelaLabel.frame = CGRect(x: profilePictureImageView.right + 10, y: usernameLabel.bottom + 10, width: width/2, height: 20).integral
        ciudadLabel.frame = CGRect(x: profilePictureImageView.right + 10, y: escuelaLabel.bottom, width: width/2, height: 20).integral
        profilePictureImageView.layer.cornerRadius = width/8
        
        nivelLabel.frame = CGRect(x: width/8, y: height/2, width: width/6, height: 20)
        nivelValorLabel.frame = CGRect(x: nivelLabel.left, y: nivelLabel.bottom, width: nivelLabel.width, height: nivelLabel.height - 5)
        puntosProgressView.frame = CGRect(x: nivelLabel.width + width/8, y: nivelLabel.height/3 + nivelLabel.top, width: width/2, height: nivelLabel.height)
        experiencePointsLabel.frame = CGRect(x: puntosProgressView.left, y: nivelValorLabel.top, width: puntosProgressView.width, height: nivelValorLabel.height)
        biografiaLabel.frame = CGRect(x: width/8, y: 2*height/3, width: width - width/4, height: height/3)
    }
}
