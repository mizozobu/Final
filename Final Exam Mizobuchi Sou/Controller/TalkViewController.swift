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
    }
    
    // Mark - property
    private let db = DBService.sharedDB
    var gcID: Int = 0
    private var talks = [Talk]()
    
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
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let ID = talks[indexPath.row].ID
//        performSegue(withIdentifier: StoryBoard.ShowTalksSegueIdentifier, sender: indexPath)
//    }
}
