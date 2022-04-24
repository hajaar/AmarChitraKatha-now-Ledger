//
//  Issue.swift
//  AmarChitraKatha now Ledger
//
//  Created by Kartik Narayanan on 24/04/22.
//
import Foundation
import SwiftUI
struct Issue: Hashable {
    var id = UUID()
    var issueNumber: String
    var issueTitle: String
    var issueYear: String
    var isOwned: Bool = false
    var issueImage: String = ""

    init(_ issueNumber: String, _ issueTitle: String, _ issueYear: String) {
        self.id = UUID()
        self.issueNumber = issueNumber
        self.issueTitle = issueTitle
        self.issueYear = issueYear
        self.isOwned = false
    }

    func getImage() -> Image {
        let uiImage =  (UIImage(named: issueNumber) ?? UIImage(systemName: "book"))!
        return Image(uiImage: uiImage)

    }
}

