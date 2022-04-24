//
//  Issue.swift
//  AmarChitraKatha now Ledger
//
//  Created by Kartik Narayanan on 24/04/22.
//
import Foundation
struct Issue {
    var id = UUID()
    var issueNumber: String
    var issueTitle: String
    var issueYear: String
    var isOwned: Bool = false

    init(_ issueNumber: String, _ issueTitle: String, _ issueYear: String) {
        self.id = UUID()
        self.issueNumber = issueNumber
        self.issueTitle = issueTitle
        self.issueYear = issueYear
        self.isOwned = false
    }
}

