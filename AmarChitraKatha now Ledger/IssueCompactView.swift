    //
    //  IssueView.swift
    //  AmarChitraKatha now Ledger
    //
    //  Created by Kartik Narayanan on 24/04/22.
    //

import Foundation
import SwiftUI

struct IssueCompactView: View {
    @Binding var issue: Issue

    var body: some View {

            HStack(alignment: .center) {
                Image(systemName: issue.isOwned ? "checkmark.square" : "square")
                    .font(.title.bold())
                    .foregroundColor(issue.isOwned ? .green : .primary)
                let im = self.issue.getImage()
                im
                    .resizable()
                    .scaledToFit()
                    .frame(width: 39, height: 40, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
                Text("\(issue.issueNumber)")
                Text("\(issue.issueTitle)")
            }
            .fixedSize(horizontal: false, vertical: true)

        
    }


}




