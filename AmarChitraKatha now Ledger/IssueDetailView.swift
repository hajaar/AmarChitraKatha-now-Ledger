    //
    //  IssueDetailView.swift
    //  AmarChitraKatha now Ledger
    //
    //  Created by Kartik Narayanan on 24/04/22.
    //
import Foundation
import SwiftUI

struct IssueDetailView: View {
    var issueNumber: String
    var body: some View {
        let issue = ACK.issues.filter() {$0.issueNumber == issueNumber}
        
        NavigationView {
            VStack {
                let im = issue[0].getImage()
                im
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400, alignment: .center)
                    .overlay(Rectangle().stroke(Color.accentColor, lineWidth: 4))


                    Text("Number: \(issue[0].issueNumber)")
                Text("Publication Year: \(issue[0].issueYear)")
                Toggle("Do you own it?", isOn: issue[0].$isOwned)


                Spacer()
            }
        }
        .navigationTitle("\(issue[0].issueTitle)")
        .navigationBarTitleDisplayMode(.inline)

    }
}

struct IssueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IssueCompactView(issueNumber: "11")
    }
}


