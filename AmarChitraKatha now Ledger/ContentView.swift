    //
    //  ContentView.swift
    //  AmarChitraKatha now Ledger
    //
    //  Created by Kartik Narayanan on 24/04/22.
    //

import SwiftUI

class MyListClass: ObservableObject {
    @Published var issues = ACK.issues
}

struct ContentView: View {
    @ObservedObject var ack = MyListClass()
    @State private var searchText: String = ""
    

    var searchResults: [Issue] {
        if searchText.isEmpty {
            return ack.issues
        } else {
            return ack.issues.filter { $0.issueTitle.contains(searchText) }
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { issue in
                    NavigationLink(destination: IssueDetailView(issue: self.$ack.issues[self.ack.issues.firstIndex(of: issue)!])) {
                        IssueCompactView(issue: self.$ack.issues[self.ack.issues.firstIndex(of: issue)!])
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
