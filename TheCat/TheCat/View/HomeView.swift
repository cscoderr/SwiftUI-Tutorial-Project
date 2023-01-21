//
//  HomeView.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = CatViewModel()
    @State private var query = ""
    @State private var isFavourite = false
    @Environment(\.managedObjectContext) var fav
    @FetchRequest(sortDescriptors: [], animation: .default) var likes: FetchedResults<Likes>

    var body: some View {
        NavigationStack {
            if let cats = vm.cats {
                ScrollView(showsIndicators: false) {
                    ForEach(cats, id: \.self.id) { cat in
                        
                        VStack {
                            let res = likes.first(where: {$0.breedID == cat.breeds.first?.id})
                            CatListItemView(isFavourite: (res != nil) ? true : false, cat: cat)
                                .padding(.bottom, 10)
                                .onTapGesture {
                                    let likes  = Likes(context: fav)
                                    likes.id = UUID()
                                    likes.breedID = cat.breeds.first?.id
                                    likes.name = cat.breeds.first?.name ?? "Unknown"
                                    likes.imageUrl = cat.url
                                    try? fav.save()
                                }
                            
                            
                        }
                    }
                }
                .padding()
               
                .navigationTitle("Cats")
                .background(.gray.opacity(0.2))
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationDestination(for: Cat.self, destination: { cat in
//                    DetailsView()
//                })
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Image(systemName: "person.circle")
//                    }
//
//                }
                
            } else {
                VStack {
                    ProgressView()
                    Text("Loading")
                }
                .alert("Error", isPresented: $vm.hasError) {
                    
                } message: {
                    Text(vm.mainError ?? "")
                }
            }
            
            
        }
        .searchable(text: $query, prompt: "Search your favourite cat")
//        .onChange(of: query) { newQuery in
//            vm.searchCats(newQuery)
//        }
        .onSubmit(of: .search) {
            vm.searchCats(query)
        }
        .onAppear {
            vm.getCats()
        }
        .overlay {
            if let cats = vm.cats {
                if(cats.isEmpty) {
                    NoResultView(query: $query)
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
