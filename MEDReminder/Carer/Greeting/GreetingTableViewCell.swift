//
//  GreetingTableViewCell.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/11/19.
//

import UIKit

class GreetingTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var greetingImageView: UIImageView!{
        didSet {
            greetingImageView.layer.cornerRadius = 20.0
            greetingImageView.clipsToBounds = true
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
