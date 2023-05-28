//
//  ViewController.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/11/14.
//

import UIKit
class ViewController: UIViewController{
   
    @IBOutlet weak var firstView : UIView!
    @IBOutlet weak var secondView : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.alpha = 0
        secondView.alpha = 1
        
        // 鍵盤按空白處消失
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing ))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func didChangeSegment(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            firstView.alpha = 0
            secondView.alpha = 1
        }
        else {
            firstView.alpha = 1
            secondView.alpha = 0
        }
    }
    
}

