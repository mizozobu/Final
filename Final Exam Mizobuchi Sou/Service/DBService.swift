//
//  DBService.swift
//  Final Exam Mizobuchi Sou
//
//  Created by user144546 on 12/19/18.
//  Copyright © 2018 IS543. All rights reserved.
//

import Foundation
import GRDB

class DBService {
    
    // MARK: - Constants
    struct Constant {
        static let fileName = "core.23"
        static let fileExtension = "db"
    }
    
    // MARK: - Properties
    var dbQueue: DatabaseQueue!
    
    static let sharedDB = DBService()
    
    // Mark - Init
    init() {
        connect()
    }
    
    private func connect() {
        dbQueue = try? DatabaseQueue(
            path: Bundle.main.path(
                forResource: Constant.fileName,
                ofType: Constant.fileExtension
            )!
        )
    }
    
    public func findLastUpdated() -> String {
        do {
            let result = try dbQueue.read { db -> String in
                if let row = try Row.fetchOne(db, "SELECT last_updated FROM updated") {
                    let lastUpdated: String = row["last_updated"]
                    print(lastUpdated)
                    return lastUpdated
                }
                return ""
            }
            return result
            
        }
        catch {
            return ""
        }
    }
}

extension String: Error {}
