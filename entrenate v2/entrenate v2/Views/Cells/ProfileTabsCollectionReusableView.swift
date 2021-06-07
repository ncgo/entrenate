//
//  ProfileTabsCollectionReusableView.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 05/06/21.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    func didTapInfoButton()
    func didTapStatsButton()
    func didTapAchievementsButton()
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    private let infoButton: UIButton = {
       let boton = UIButton()
        boton.clipsToBounds = true
        boton.tintColor = .systemGreen
        boton.setBackgroundImage(UIImage(systemName: "info"), for: .normal)
        return boton
    }()
    
    private let statsButton: UIButton = {
       let boton = UIButton()
        boton.clipsToBounds = true
        boton.tintColor = .secondarySystemBackground
        boton.setBackgroundImage(UIImage(systemName: "house"), for: .normal)
        return boton
    }()
    
    private let achievementsButton: UIButton = {
       let boton = UIButton()
        boton.clipsToBounds = true
        boton.tintColor = .secondarySystemBackground
        boton.setBackgroundImage(UIImage(systemName: "person"), for: .normal)
        return boton
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray3
        addSubview(infoButton)
        addSubview(statsButton)
        addSubview(achievementsButton)
        
        infoButton.addTarget(self, action: #selector(didTapInfoButton), for: .touchUpInside)
        
        statsButton.addTarget(self, action: #selector(didTapStatsButton), for: .touchUpInside)
        
        achievementsButton.addTarget(self, action: #selector(didTapAchievementsButton), for: .touchUpInside)
    }
    
    @objc private func didTapInfoButton() {
        delegate?.didTapInfoButton()
    }
    
    @objc private func didTapStatsButton() {
        delegate?.didTapStatsButton()
    }
    
    @objc private func didTapAchievementsButton() {
        delegate?.didTapAchievementsButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = height/2
        let widthBt = ((width/3)-size)/3
        infoButton.frame = CGRect(x: widthBt, y: height/4, width: size, height: size)
        statsButton.frame = CGRect(x: width/3 + widthBt, y: height/4, width: size, height: size)
        achievementsButton.frame = CGRect(x: 2*(width/3) + widthBt, y: height/4, width: size, height: size)
    }
}
