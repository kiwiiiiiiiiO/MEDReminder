//
//  NewReminderController.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/12/27.
//

import UIKit

class NewReminderController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 鍵盤碰到空白處消失
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing ))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        setmenuButton()
    }
    
    // 打開照片庫，使用UIImagePickerController API
    // 某個Cell被選取後會呼叫 tableView(_:didSelectRowAt:) 方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
        let photoSourceRequestController = UIAlertController(
        title: "", message: "選擇圖片", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "相機", style: .default, handler : {
            (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                imagePicker.delegate = self
                self.present(imagePicker, animated: true, completion: nil) }
    })
        
    let photoLibraryAction = UIAlertAction(title: "照片庫", style: .default, handler: {
        (action) in
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil) }
    })
        
    photoSourceRequestController.addAction(cameraAction)
    photoSourceRequestController.addAction(photoLibraryAction)
    // 針對 iPad
    if let popoverController = photoSourceRequestController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
    }
    present(photoSourceRequestController, animated: true, completion: nil) }
    }
    
    // 變數：圖片視圖
    @IBOutlet var photoImageView: UIImageView! {
        didSet {
            photoImageView.layer.cornerRadius = 10.0
            photoImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var menubutton : UIButton!
    
    func setmenuButton(){
        let optionClosure1 = {(action : UIAction) in
            print(action.title)}
        
        menubutton.menu = UIMenu(children : [
            UIAction(title : "維骨力", state: .on, handler: optionClosure1),
            UIAction(title : "善存", handler: optionClosure1)])
        menubutton.showsMenuAsPrimaryAction = true
        menubutton.changesSelectionAsPrimaryAction = true
    }
}

// 當使用者從照片庫選擇一張照片後，呼叫此方法取得所選取的照片
extension NewReminderController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
       didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any]) {
        
            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                photoImageView.image = selectedImage
                photoImageView.contentMode = .scaleAspectFill
                photoImageView.clipsToBounds = true
            }
        dismiss(animated: true, completion: nil)
    }
}
