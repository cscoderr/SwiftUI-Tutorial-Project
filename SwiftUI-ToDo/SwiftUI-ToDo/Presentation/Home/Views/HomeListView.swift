//
//  HomeListView.swift
//  SwiftUI-ToDo
//
//  Created by Tomiwa Idowu on 1/15/24.
//

import SwiftUI

struct HomeListView: View {
    var body: some View {
        HStack {
            Image(systemName: "list.bullet")
                .padding(.all, 8)
                .background(.indigo)
                .clipShape(Circle())
                
                
            Text("Home Work")
                
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.gray)
            Spacer()
            Text(String("1"))
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(.cardBg)
        .cornerRadius(15)
        .onTapGesture {
            
        }
        .swipeActions {
            Button(role: .destructive) {
                
            } label: {
                Label("Delete", systemImage: "trash")
                    .symbolVariant(.fill)
            }

        }
    }
}

#Preview {
    HomeListView()
}
