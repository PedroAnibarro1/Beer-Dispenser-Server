//
//  User.swift
//  App
//
//  Created by Pedro Anibarro on 12/18/17.
//

import Foundation
import FluentProvider

final class User: Model {
    
    // Entity
    static let entity = "Users"
    
    // MARK: - Properties
    var userID: Int
    var firstName: String
    var lastName: String
    var email: String?
    var credit: Int
    var password: String?
    let storage = Storage()
    
    init(row: Row) throws {
        self.userID = try row.get("userID")
        self.firstName = try row.get("firstName")
        self.lastName = try row.get("lastName")
        self.email = try row.get("email")
        self.credit = try row.get("credit")
        self.password = try row.get("password")
    }
    
    init(userID: Int, firstName: String, lastName: String, email: String?, credit: Int, password: String?) {
        // Store information
        self.userID = userID
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.credit = credit
        self.password = password
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        
        try row.set("userID", self.userID)
        try row.set("firstName", self.firstName)
        try row.set("lastName", self.lastName)
        try row.set("email", self.email)
        try row.set("credit", self.credit)
        try row.set("password", self.password)
        
        return row
    }
}

extension User: Preparation {
    static func prepare(_ database: Database) throws {
    }
    
    static func revert(_ database: Database) throws {
    }
}
