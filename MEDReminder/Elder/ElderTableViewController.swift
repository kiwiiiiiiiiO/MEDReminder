//
//  ElderTableViewController.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/12/8.
//

import UIKit

class ElderTableViewController: UITableViewController {

    var elder:[Elder] = [
        Elder(e_title: "完成午餐飯後吃藥", e_image: "午餐飯後"),
        Elder(e_title: "午安愉悅", e_image: "午安愉悅"),
        Elder(e_title: "早安", e_image: "早安")
    ]
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
    
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,Elder>()
            snapshot.appendSections([.all])
            snapshot.appendItems(elder, toSection: .all)
            dataSource.apply(snapshot, animatingDifferences: false)
            tableView.cellLayoutMarginsFollowReadableWidth = true
        }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, Elder>{
        
        let cellIdentifier = "datacell"
        
        let dataSource = UITableViewDiffableDataSource<Section, Elder>(
            tableView: tableView,
            cellProvider: { tableView, indexPath, elder in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ElderTableViewCell
                cell.titleLabel.text = elder.e_title
                cell.elderImageView.image = UIImage(named: elder.e_image)
                return cell }
    )
        return dataSource
    }
}
