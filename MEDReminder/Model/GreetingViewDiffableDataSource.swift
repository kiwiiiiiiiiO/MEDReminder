//
//  GreetingViewDiffableDataSource.swift
//  MEDReminder
//
//  Created by 歐杰妮 on 2023/1/1.
//

import UIKit

enum Section {
    case all
}
class GreetingViewDiffableDataSource: UITableViewDiffableDataSource<Section, Greeting> {
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            if let greeting = self.itemIdentifier(for: indexPath) {
                var snapshot = self.snapshot()
                snapshot.deleteItems([greeting])
                self.apply(snapshot, animatingDifferences: true)
            }
        }
    }
}
