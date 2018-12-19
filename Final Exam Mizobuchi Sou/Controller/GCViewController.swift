//
//  GCViewController.swift
//  Final Exam Mizobuchi Sou
//
//  Created by user144546 on 12/19/18.
//  Copyright © 2018 IS543. All rights reserved.
//

import UIKit

class GCViewController: UITableViewController {
    
    // Mark - constant
    private struct StoryBoard {
        static let GCCellIdentifier = "GCCellIdentifier"
    }
    
    
    // Mark - property
    private let db = DBService.sharedDB
    private var gcs = [GC]()
    
    // Mark - table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gcs = db.findAllGCs()
        return gcs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryBoard.GCCellIdentifier, for: indexPath)
        cell.textLabel?.text = gcs[indexPath.row].Abbr
        
        return cell
    }
    
    // Mark - table view delegate
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let id = items[indexPath.row].id
//        if let i = id {
//            do {
//                try db.setItemToDone(i)
//                items.remove(at: indexPath.row)
//                self.tableView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: UITableView.RowAnimation.right)
//            }
//            catch {
//                print("Error in set item \(i) to done")
//            }
//        }
//    }
}
