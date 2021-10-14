//
//  SearchableList.swift
//  test
//
//  Created by Adam Jemni on 10/13/21.
//

import SwiftUI

struct SearchableList: View {
    
    let groceries = ["Apple", "Banana", "Grapes"]
    @State private var searchText: String = ""
    
    var body: some View {
        
        NavigationView {
            
            List(searchResult, id: \.self) { grocerie in
                Button("\(grocerie)") { print("Tapped") }
            }
            .searchable(text: $searchText)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Title")
        }
    }
    
    var searchResult: [String] {
        guard !searchText.isEmpty else { return groceries }
        return groceries.filter { $0.contains(searchText) }
    }
}

struct SearchableList_Previews: PreviewProvider {
    static var previews: some View {
        SearchableList().previewLayout(.sizeThatFits)
    }
}
