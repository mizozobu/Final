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
    
    public func findAllGCs() -> [GC] {
        do {
            
            let gcs = try dbQueue.inDatabase { (db: Database) -> [GC] in
                var gcs = [GC]()
                let rows = try Row.fetchCursor(db, "SELECT * FROM conference ORDER BY IssueDate DESC")
                
                while let row = try rows.next() {
                    gcs.append(GC(row: row))
                }
                return gcs
            }
            return gcs
        }
        catch {
            return []
        }
    }
    
    public func findAllTalksForConfID(_ id: Int) -> [Talk] {
        do {
            
            let talks = try dbQueue.inDatabase { (db: Database) -> [Talk] in
                var talks = [Talk]()
                let rows = try Row.fetchCursor(db, """
                        SELECT t.ID, t.Title, s.Description \
                        FROM talk t JOIN conference_talk c JOIN conf_session s \
                        WHERE t.ID-c.TalkID AND c.SessionID=s.ID AND s.ConferenceID=? \
                        ORDER BY s.Sequence, c.Sequence;
                    """, arguments: [id], adapter: nil
                )
                
                while let row = try rows.next() {
                    talks.append(Talk(row: row))
                }
                return talks
            }
            return talks
        }
        catch {
            return []
        }
    }
}

extension String: Error {}
