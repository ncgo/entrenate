//
//  ProblemaListaTableViewCell.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 06/06/21.
//

import UIKit

class ProblemaListaTableViewCell: UITableViewCell {
    static let identifier = "ProblemaSeleccion"
    
    private let statusImage: UIImageView = {
        let statusImg = UIImageView()
        statusImg.contentMode = .scaleAspectFill
        return statusImg
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
