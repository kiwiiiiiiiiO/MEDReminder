//
//  PersonalViewController.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2023/1/2.
//

import UIKit

class PersonalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var elderImageView: UIImageView!{
        didSet {
            elderImageView.layer.cornerRadius = elderImageView.frame.size.height/2
            elderImageView.clipsToBounds = true
        }
    }
}
