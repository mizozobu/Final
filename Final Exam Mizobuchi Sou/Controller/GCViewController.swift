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
        static let ShowTalksSegueIdentifier = "ShowTalksSegueIdentifier"
    }
    
    
    // Mark - property
    private let db = DBService.sharedDB
    private var gcs = [GC]()
    
    // Mark - view life cycyle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoard.ShowTalksSegueIdentifier {
            if let talkVC = segue.destination as? TalkViewController {
                if let indexPath = sender as? IndexPath {
                    talkVC.gcID = gcs[indexPath.row].ID
                }
            }
        }
    }
    
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: StoryBoard.ShowTalksSegueIdentifier, sender: indexPath)
    }
}
