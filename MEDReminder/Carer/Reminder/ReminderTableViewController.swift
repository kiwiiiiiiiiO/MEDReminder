//
//  ReminderTableViewController.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/11/18.
//

import UIKit

class ReminderTableViewController: UITableViewController {
    
//    var reminderTitles = ["Morning","Noon","Night"]
//    var reminderTimes = ["7:00","12:00","18:00"]
//    var medicines = ["Heart Attack","Heart Attack, Bone","Heart Attack, Bone, Hair"]
    
    
    var reminder:[Reminder] = [
        Reminder(r_title:"早餐飯後", r_time:"7:00", r_medicine: "善存"),
        Reminder(r_title:"午餐飯後", r_time:"13:00", r_medicine: "善存、維骨力、心臟病"),
        Reminder(r_title:"晚餐飯後", r_time:"18:00", r_medicine: "善存、心臟病")
    ]
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Reminder>()
        snapshot.appendSections([.all])
        snapshot.appendItems(reminder, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false)
        tableView.cellLayoutMarginsFollowReadableWidth = true
    
    }
    
    func configureDataSource() -> ReminderViewDiffableDataSource{
        let cellIdentifier = "datacell"
        
        let dataSource = ReminderViewDiffableDataSource(
            
            tableView: tableView,
            cellProvider: { tableView, indexPath, reminder in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)  as! ReminderTableViewCell
                cell.titleLabel.text = reminder.r_title
                cell.reminderImageView.image = UIImage(named: reminder.r_title)
                cell.medicinesLabel.text = reminder.r_medicine
                cell.timeLabel.text = reminder.r_time
                return cell }
    )
        return dataSource
    }
    // 回到上一個導覽控制器
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        self.navigationController?.popViewController(animated: true)
    }
}

