//
//  JYStatusCTableViewCell.swift
//  JYVVVeibo
//
//  Created by atom on 16/9/15.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class JYStatusCell: UITableViewCell {
    
    
    @IBOutlet weak var iconview: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var memberIconview: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var sourceLabel: UILabel!

    @IBOutlet weak var vipIconView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
