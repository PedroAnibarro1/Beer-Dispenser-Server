//
//  RFID.swift
//  App
//
//  Created by Pedro Anibarro on 12/18/17.
//

import Foundation
import FluentProvider

final class RFID: Model {
    
    // Entity
    static let entity = "RFIDs"
    
    // MARK: - Properties
    var userID: Int
    var rfid: String
    let storage = Storage()
    
    init(row: Row) throws {
        self.userID = try row.get("userID")
        self.rfid = try row.get("rfid")
    }
    
    init(userID: Int, rfid: String) {
        // Store information
        self.userID = userID
        self.rfid = rfid
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        
        try row.set("userID", self.userID)
        try row.set("rfid", self.rfid)
        
        return row
    }
}

extension RFID: Preparation {
    static func prepare(_ database: Database) throws {
    }
    
    static func revert(_ database: Database) throws {
    }
}
