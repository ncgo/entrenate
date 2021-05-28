//
//  TableViewCellLeaderboard.swift
//  entrenate
//
//  Created by user189912 on 5/28/21.
//

import UIKit

class TableViewCellLeaderboard: UITableViewCell {

    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbCity: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
