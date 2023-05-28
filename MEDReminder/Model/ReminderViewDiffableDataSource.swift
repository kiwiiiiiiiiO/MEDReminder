//
//  RemainderViewDiffableDataSource.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2023/1/1.
//

import UIKit

class ReminderViewDiffableDataSource: UITableViewDiffableDataSource<Section, Reminder> {
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            if let reminder = self.itemIdentifier(for: indexPath) {
                var snapshot = self.snapshot()
                snapshot.deleteItems([reminder])
                self.apply(snapshot, animatingDifferences: true)
            }
        }
    }
}
