//
//  SearchView.swift
//  Flick
//
//  Created by Tomiwa Idowu on 1/6/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("Search")
            .searchable(text: $searchText)
    }
}

#Preview {
    SearchView()
}
