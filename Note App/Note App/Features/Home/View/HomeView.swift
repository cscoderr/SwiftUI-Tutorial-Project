//
//  HomeView.swift
//  Note App
//
//  Created by Tomiwa Idowu on 30/01/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresent = false
    
    @FetchRequest(sortDescriptors: []) var noteList: FetchedResults<NoteList>
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    func color(data:Data?) -> UIColor? {
        if let data = data {
            return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
        }
        return UIColor.gray
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if(noteList.isEmpty) {
                    VStack(alignment: .center) {
                        Image(systemName: "books.vertical")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.bottom, 10)
                        
                        Text("No Note Available")
                            .font(.title2)
                    }
                    
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns) {
                            ForEach(noteList, id: \.self) { note in
                                HomeItemView(
                                    title: note.title ?? "", description: note.content ?? "",
                                    color: self.color(data: note.color) ?? UIColor.gray
                                )
                                    .padding(.bottom, 10)
                                    
                                
                            }
                            
                        }
                    }
                    
                   
                }
            }
            .sheet(isPresented: $isPresent) {
                AddReminderView()
            }
            .padding(.horizontal, 20)
            .navigationTitle("My Note Book")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Add", action: {
                isPresent.toggle()
            }))
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
