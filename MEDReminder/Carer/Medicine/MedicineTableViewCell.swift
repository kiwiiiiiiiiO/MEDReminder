//
//  MedicineTableViewCell.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/11/18.
//

import UIKit

class MedicineTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var LocationLabel: UILabel!
    @IBOutlet var PackageLabel: UILabel!
    @IBOutlet var StartDateLabel: UILabel!
    @IBOutlet var StartTimeLabel :UILabel!
    @IBOutlet var EndDateLabel: UILabel!
    @IBOutlet var EndTimeLabel : UILabel!
    @IBOutlet var DoseNumLabel : UILabel!
    @IBOutlet var DoseUnitLabel :UILabel!
    @IBOutlet var MedicineImageView: UIImageView!
    @IBOutlet var LocationImageView: UIImageView!
    @IBOutlet var PackgeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
