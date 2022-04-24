    //
    //  IssueDetailView.swift
    //  AmarChitraKatha now Ledger
    //
    //  Created by Kartik Narayanan on 24/04/22.
    //
import Foundation
import SwiftUI

struct IssueDetailView: View {
    @Binding var issue: Issue
    var body: some View {
        NavigationView {
            VStack {
                let im = issue.getImage()
                im
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400, alignment: .center)
//                    .overlay(Rectangle().stroke(Color.accentColor, lineWidth: 4))
                    .shadow(color: .primary, radius: 5, x: 5, y: 5)


                    Text("Number: \(issue.issueNumber)")
                    .padding()
                Text("Publication Year: \(issue.issueYear)")
                    .padding()
                Toggle("Do you own it?", isOn: $issue.isOwned)
                    .padding()
                Spacer()
            }
        }
        .navigationTitle("\(issue.issueTitle)")
        .navigationBarTitleDisplayMode(.inline)

    }
}




