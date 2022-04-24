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
    @State private var propertySelection = 1
    

    var searchResults: [Issue] {
        if searchText.isEmpty {
            return ack.issues.filter {
                switch propertySelection {
                case 1:
                    return $0.isOwned == true || $0.isOwned == false
                case 2:
                    return $0.isOwned == true
                case 3:
                    return $0.isOwned == false
                default:
                    return $0.isOwned == true || $0.isOwned == false
                }
            }
        } else {
            return ack.issues.filter { $0.issueTitle.contains(searchText)}
        }
    }


    var body: some View {


        NavigationView  {
            List {
                ForEach(searchResults, id: \.self) { issue in   //replace with SearchResults
                    NavigationLink(destination: IssueDetailView(issue: self.$ack.issues[self.ack.issues.firstIndex(of: issue)!])) {
                        IssueCompactView(issue: self.$ack.issues[self.ack.issues.firstIndex(of: issue)!])
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker(selection: $propertySelection, label: Text("Display Property")) {
                        Text("All").tag(1)
                        Text("Owned").tag(2)
                        Text("Not Owned").tag(3)

                    }
                }
            }
        }

    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
