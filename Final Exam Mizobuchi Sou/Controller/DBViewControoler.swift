//
//  DBViewControoler.swift
//  Final Exam Mizobuchi Sou
//
//  Created by user144546 on 12/19/18.
//  Copyright © 2018 IS543. All rights reserved.
//

import UIKit
import GRDB

class DBViewController: UIViewController {
    
    // Mark - property
    private let db = DBService.sharedDB
    
    // Mark - outlet
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    override func viewDidLoad() {
        let lastUpdated = db.findLastUpdated()
        
        lastUpdatedLabel.text = lastUpdated
    }
}
