//
//  MedicineTableViewController.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2022/11/18.
//

import UIKit

class MedicineTableViewController: UITableViewController {

    lazy var dataSource = configureDataSource()
    
    var medicine:[Medicine] = [
        Medicine(m_name:"心臟病",m_location: "茶水間收納櫃", m_package: "心臟病藥瓶", m_startDate: "2022/5/6", m_start: "早餐飯後", m_endDate: "2022/5/30", m_end: "早餐飯後",m_doseNums: "2",m_doseUnits: "片"),
        
        Medicine(m_name:"維骨力",m_location: "客廳收納櫃", m_package: "金色維骨力藥瓶", m_startDate: "2022/6/6", m_start: "午餐飯後", m_endDate: "2022/6/20", m_end: "晚餐飯後",m_doseNums: "7",m_doseUnits: "顆"),
        
        Medicine(m_name:"善存",m_location: "床頭櫃", m_package: "銀髮善存藥瓶", m_startDate: "2022/7/6", m_start: "早餐飯後", m_endDate: "2022/7/30", m_end: "晚餐飯後",m_doseNums: "2",m_doseUnits: "顆"),
      
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none

        var snapshot = NSDiffableDataSourceSnapshot<Section, Medicine>()
        snapshot.appendSections([.all])
        snapshot.appendItems(medicine, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false)
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }
    
    // -> return 回傳物件的型別。UITableViewDiffableDataSource是一個泛型物件，能夠處理不同區塊的型別與一個表格視圖的項目
    func configureDataSource() -> MedicineViewDiffableDataSource {
        let cellIdentifier = "datacell"
        
        let dataSource = MedicineViewDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, medicine in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)  as! MedicineTableViewCell
                cell.nameLabel.text = medicine.m_name
                cell.MedicineImageView.image = UIImage(named: medicine.m_name)
                cell.LocationLabel.text = medicine.m_location
                cell.LocationImageView.image = UIImage(named: medicine.m_location)
                cell.PackageLabel.text = medicine.m_package
                cell.PackgeImageView.image = UIImage(named: medicine.m_package)
                cell.StartDateLabel.text = medicine.m_startDate
                cell.StartTimeLabel.text = medicine.m_start
                cell.EndDateLabel.text = medicine.m_endDate
                cell.EndTimeLabel.text = medicine.m_end
                cell.DoseNumLabel.text = medicine.m_doseNums
                cell.DoseUnitLabel.text = medicine.m_doseUnits
                return cell }
    )
        return dataSource
    }
    // 回到上一個導覽控制器
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
