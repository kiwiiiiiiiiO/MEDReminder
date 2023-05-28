//
//  AlertViewController.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2023/1/1.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 鍵盤按空白處消失
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing ))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //底部彈出提示框
    @IBAction func simpleAlert(){
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 25)!, NSAttributedString.Key.foregroundColor:UIColor.black]
        let titleString = NSAttributedString(string: "忘記密碼了嗎？", attributes: titleAttributes)
        let messageAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 17)!, NSAttributedString.Key.foregroundColor: UIColor.black]
          let messageString = NSAttributedString(string: "幫您通知常用聯絡人！", attributes: messageAttributes)
        alertController.setValue(titleString, forKey: "attributedTitle")
        alertController.setValue(messageString, forKey: "attributedMessage")

        let okAction = UIAlertAction(title: "好的！", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "沒關係", style: .cancel, handler: nil)
        okAction.setValue(UIColor.green, forKey: "titleTextColor")
        cancelAction.setValue(UIColor.gray, forKey: "titleTextColor")
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
