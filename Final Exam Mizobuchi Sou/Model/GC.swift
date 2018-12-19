//
//  GC.swift
//  Final Exam Mizobuchi Sou
//
//  Created by user144546 on 12/19/18.
//  Copyright © 2018 IS543. All rights reserved.
//

import Foundation
import GRDB

class GC : Record {
    
    // Mark - Table name
    override class var databaseTableName: String {
        return "conference"
    }
    
    // Mark - Property
    var ID: Int
    var Description: String
    var Abbr: String
    var Year: Int
    var Annual: String
    var IssueDate: String
    
    // Mark - Init
    init(ID: Int, Description: String, Abbr: String, Year: Int, Annual: String, IssueDate: String) {
        self.ID = ID
        self.Description = Description
        self.Abbr = Abbr
        self.Year = Year
        self.Annual = Annual
        self.IssueDate = IssueDate
        
        super.init()
    }
    
    required init(row: Row) {
        ID = row["ID"]
        Description = row["Description"]
        Abbr = row["Abbr"]
        Year = row["Year"]
        Annual = row["Annual"]
        IssueDate = row["IssueDate"]
        
        super.init(row: row)
    }
    
//    override func encode(to container: inout PersistenceContainer) {
//        container["id"] = id
//        container["name"] = name
//        container["isDone"] = isDone
//    }
}

