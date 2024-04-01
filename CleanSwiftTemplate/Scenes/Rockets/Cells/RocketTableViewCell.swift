//
//  RocketTableViewCell.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 1.04.2024.
//

import UIKit

class RocketTableViewCell: UITableViewCell {

    @IBOutlet private weak var rocketImageView: UIImageView!
    @IBOutlet private weak var rocketNameLabel: UILabel!
    @IBOutlet private weak var rocketDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
