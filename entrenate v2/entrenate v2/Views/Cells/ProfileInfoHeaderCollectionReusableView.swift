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
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let ciudadLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let experiencePointsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let nivelLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let categoriaLabel: UILabel = {
        let label = UILabel()
        return label
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //profilePictureImageView.
    }
}
