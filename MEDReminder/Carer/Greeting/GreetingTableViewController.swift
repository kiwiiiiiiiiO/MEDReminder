//
//  GreetingTableViewController.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/11/19.
//

import UIKit

class GreetingTableViewController: UITableViewController {
    
    var greeting:[Greeting] = [
        //self.init(g_title: "", g_date: "", g_text: "", g_image: "", g_time: "")
        Greeting(g_title:"早安", g_date:"12/2", g_text:"今天也要記得多喝水喔!", g_time: "6:00"),
        Greeting(g_title:"午安愉悅", g_date:"12/3", g_text:"祝您有個美好的一天", g_time: "12:00"),
        Greeting(g_title:"晚安", g_date:"12/4", g_text:"祝您晚上做個好夢！", g_time: "17:00")
    ]
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
    
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Greeting>()
        snapshot.appendSections([.all])
        snapshot.appendItems(greeting, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false)
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }
    
    func configureDataSource() -> GreetingViewDiffableDataSource{
        
        let cellIdentifier = "datacell"
        
        let dataSource = GreetingViewDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, greeting in
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)  as! GreetingTableViewCell
                cell.timeLabel.text = greeting.g_time
                cell.dateLabel.text = greeting.g_date
                cell.titleLabel.text = greeting.g_title
                cell.contentLabel.text = greeting.g_text
                cell.greetingImageView.image = UIImage(named: greeting.g_title)
                
                return cell }
    )
        return dataSource
    }
    
    // 回到上一個導覽控制器
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
