//
//  LeaderboardTableViewCell.swift
//  entrenate v2
//
//  Created by Sergio Tapia on 06/06/21.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    static let identifier = "LeaderboardTableViewCell"
    
    private let placementImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "1st")
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private let pointsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 0, green: 0.50, blue: 0.22, alpha: 1)
        contentView.addSubview(placementImage)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(pointsLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(imgName: String, lbPointsText: String, lbUserText: String){
        usernameLabel.text = lbUserText
        placementImage.image = UIImage(named: imgName)
        pointsLabel.text = lbPointsText
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        usernameLabel.text = nil
        placementImage.image = nil
        pointsLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height - 20
        
        placementImage.frame = CGRect(x: 5, y: contentView.frame.size.height - imageSize - 5, width: 70, height: contentView.frame.size.height - 30)
        usernameLabel.frame = CGRect(x: 15 + placementImage.frame.size.width, y: 0, width: contentView.frame.size.width - 10, height: contentView.frame.size.height)
        pointsLabel.frame = CGRect(x: contentView.frame.size.width - imageSize, y: 0, width: contentView.frame.size.width - 10, height: contentView.frame.size.height)
    }

}

/*
cell.textLabel?.text = userData[indexPath.row].user


switch(indexPath.row){
case 0:
    cell.imageView?.image = UIImage(named: "1st")
case 1:
    cell.imageView?.image = UIImage(named: "2nd")
case 2:
    cell.imageView?.image = UIImage(named: "3rd")
default:
    cell.imageView?.image = UIImage(named: "4th+")
    
}
*/
