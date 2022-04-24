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
       //             NavigationLink(destination: Text(issue.issueTitle)) {
                        IssueCompactView(issueNumber: issue.issueNumber)
                        .background(issue.isOwned ? .green : .clear)
                            .swipeActions {
                                Button("Owned") {
                                    var i = ACK.issues.filter() {$0.issueNumber == issue.issueNumber}
                                    i[0].isOwned = true
                                    print(i[0].issueNumber)
                                    print(i[0].isOwned)
                                }
                                .tint(.green)
                            }

        //            }
                }
            }
            .searchable(text: $searchText) {
                ForEach(searchResults, id: \.self) { result in
                    Text("Are you looking for \(result.issueTitle)?").searchCompletion(result.issueTitle  )
                }
            }
            .navigationTitle("ACK Now Ledger")
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
