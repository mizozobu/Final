//
//  TalkViewController.swift
//  Final Exam Mizobuchi Sou
//
//  Created by user144546 on 12/19/18.
//  Copyright © 2018 IS543. All rights reserved.
//

import UIKit

class TalkViewController: UITableViewController {
    
    // Mark - constant
    private struct StoryBoard {
        static let TalkCellIdentifier = "TalkCellIdentifier"
        static let ShowContentIdentifier = "ShowContentIdentifier"
    }
    
    // Mark - property
    private let db = DBService.sharedDB
    var gcID: Int = 143
    private var talks = [Talk]()
    
    // Mark - view life cycyle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoard.ShowContentIdentifier {
            if let contentVC = segue.destination as? ContentViewController {
                if let indexPath = sender as? IndexPath {
                    contentVC.talkID = talks[indexPath.row].ID
                }
            }
        }
    }
    
    // Mark - table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        talks = db.findAllTalksForConfID(gcID)
        return talks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryBoard.TalkCellIdentifier, for: indexPath)
        cell.textLabel?.text = talks[indexPath.row].Title
        
        return cell
    }
    
    // Mark - table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: StoryBoard.ShowContentIdentifier, sender: indexPath)
    }
}
