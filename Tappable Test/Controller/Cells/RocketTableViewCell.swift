//
//  RocketTableViewCell.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/11/21.
//

import UIKit

class RocketTableViewCell: UITableViewCell {

    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var fireDateLabel: UILabel!
    @IBOutlet weak var successRateImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.rocketImageView.layer.cornerRadius = self.rocketImageView.frame.size.width/2
        self.rocketImageView.layer.masksToBounds = true
        
    }
}
