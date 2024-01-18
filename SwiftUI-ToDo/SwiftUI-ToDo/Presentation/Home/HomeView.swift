//
//  HomeView.swift
//  SwiftUI-ToDo
//
//  Created by Tomiwa Idowu on 1/14/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 20) {
                    HomeCardView(text: "Today", image: "calendar", iconBackgroudColor: .red, count: 5)
                    HomeCardView(text: "Scheduled", image: "calendar.badge.plus", iconBackgroudColor: .blue, count: 10)
                }
                .padding(.bottom, 10)
                
                HomeCardView(text: "All", image: "photo", iconBackgroudColor: .gray, count: 15)
                
                Text("My lists")
                    .font(.title)
                    .fontWeight(.bold)
                
                List {
                    ForEach(0..<10, id: \.self) { _ in
                        HomeListView()
                    }
                }
                Spacer()
            }
            .navigationTitle("Remindee")
            .toolbar {
                ToolbarItem {
                    Image(systemName: "magnifyingglass")
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    HomeView()
}
