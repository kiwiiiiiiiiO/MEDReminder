//
//  MedicineViewDiffableDataSource.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2023/1/1.
//

import UIKit

class MedicineViewDiffableDataSource: UITableViewDiffableDataSource<Section, Medicine> {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            if let medicine = self.itemIdentifier(for: indexPath) {
                var snapshot = self.snapshot()
                snapshot.deleteItems([medicine])
                self.apply(snapshot, animatingDifferences: true)
            }
        }
    }
}
