//
//  ElderTableViewCell.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/12/8.
//

import UIKit

class ElderTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var elderImageView: UIImageView!{
        didSet {
            elderImageView.layer.cornerRadius = 25.0
            elderImageView.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
