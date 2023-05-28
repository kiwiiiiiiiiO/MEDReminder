//
//  ReminderTableViewCell.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/11/18.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var medicinesLabel: UILabel!
    @IBOutlet var reminderImageView: UIImageView!{
        didSet {
            reminderImageView.layer.cornerRadius = 20.0
            reminderImageView.clipsToBounds = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var backgroundswitch: UISwitch!
    @IBAction func switchdidChange(_ sender: UISwitch){
        if sender.isOn {
            self.backgroundColor = UIColor.white
        }else{
            self.backgroundColor = UIColor.lightGray
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
