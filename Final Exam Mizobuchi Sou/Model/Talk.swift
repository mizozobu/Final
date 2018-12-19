//
//  Talk.swift
//  Final Exam Mizobuchi Sou
//
//  Created by user144546 on 12/19/18.
//  Copyright © 2018 IS543. All rights reserved.
//

import Foundation
import GRDB

class Talk : Record {
    
    // Mark - Table name
    override class var databaseTableName: String {
        return "talk"
    }
    
    // Mark - Property
    var ID: Int
//    var Corpus: String
//    var URL: String
    var Title: String?
//    var Date: String
//    var SpeakerID: Int
//    var ListenURL: String
//    var WatchURL: String
    var Description: String?
    
    // Mark - Init
    init(ID: Int, Title: String = "", Description: String = "") {
        self.ID = ID
//        self.Corpus = Corpus
//        self.URL = URL
        self.Title = Title
//        self.Date = Date
//        self.SpeakerID = SpeakerID
//        self.ListenURL = ListenURL
//        self.WatchURL = WatchURL
        self.Description = Description
        
        super.init()
    }
    
    required init(row: Row) {
        ID = row["ID"]
//        Corpus = row["Corpus"]
//        URL = row["URL"]
        Title = row["Title"]
//        Date = row["Date"]
//        SpeakerID = row["Annual"]
//        ListenURL = row["ListenURL"]
//        WatchURL = row["WatchURL"]
        Description = row["Description"]
        
        super.init(row: row)
    }
}
