//
//  ElderMedicineController.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/12/27.
//

import UIKit

class ElderController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // circle button
        self.button.layer.cornerRadius = self.button.frame.size.height/2
    }
    
    @IBAction func simpleAlert() {
        let alertController = UIAlertController(title: "下載成功！",
                                                message: nil, preferredStyle: .alert)
        //顯示alert
        self.present(alertController, animated: true, completion: nil)
        //1秒自動消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }
}
