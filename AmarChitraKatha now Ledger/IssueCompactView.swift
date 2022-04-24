//
//  IssueView.swift
//  AmarChitraKatha now Ledger
//
//  Created by Kartik Narayanan on 24/04/22.
//

import Foundation
import SwiftUI

struct IssueCompactView: View {
    var issueNumber: String
    var issue: [Issue] {
        return ACK.issues.filter() {$0.issueNumber == issueNumber}
    }
    var body: some View {
        HStack(alignment: .center) {

            let im = issue[0].getImage()
            im
                .resizable()
                .scaledToFit()
                .frame(width: 39, height: 40, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
            Text("\(issue[0].issueNumber)")
            Text("\(issue[0].issueTitle)")
        }
        .fixedSize(horizontal: false, vertical: true)
        
    }

}

struct IssueCompactView_Previews: PreviewProvider {
    static var previews: some View {
        IssueCompactView(issueNumber: "11")
    }
}


