    //
    //  ContentView.swift
    //  AmarChitraKatha now Ledger
    //
    //  Created by Kartik Narayanan on 24/04/22.
    //

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    

    var searchResults: [Issue] {
        if searchText.isEmpty {
            return ACK.issues
        } else {
            return ACK.issues.filter { $0.issueTitle.contains(searchText) }
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { issue in
                    NavigationLink(destination: IssueDetailView(issueNumber: issue.issueNumber)) {
                        IssueCompactView(issueNumber: issue.issueNumber)
                        .background(issue.isOwned ? .green : .clear)
                    }
                }
            }
            .searchable(text: $searchText) {
                ForEach(searchResults, id: \.self) { result in
                    Text("Are you looking for \(result.issueTitle)?").searchCompletion(result.issueTitle  )
                }
            }
            .navigationTitle("ACK Now Ledger")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func scanACK() {

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
