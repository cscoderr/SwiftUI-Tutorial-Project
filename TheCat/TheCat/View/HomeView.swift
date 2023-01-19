//
//  HomeView.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 18/01/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = CatViewModel()
    var body: some View {
        NavigationStack {
            if let cats = vm.cats {
                ScrollView(showsIndicators: false) {
                    ForEach(cats, id: \.self.id) { cat in
                        VStack {
                            CatListItem(cat: cat)
                                .padding(.bottom, 10)
                            
                            
                        }
                    }
                }
                .padding()
               
                .navigationTitle("Cats")
                .background(.gray.opacity(0.2))
                .navigationBarTitleDisplayMode(.inline)
//                .navigationDestination(for: Cat.self, destination: { cat in
//                    DetailsView()
//                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "person.circle")
                    }

                }
                
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
        .onAppear {
            vm.getCats()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CatListItem: View {
    let cat: Cat
    var str: String {
        cat.breeds.first?.description ?? ""
    }
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: .init(string: cat.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame( width: 70, height: 70)
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous))
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(cat.breeds.first?.name ?? "No Name")
                    .font(.system(.title2, weight: .bold))
                
                Text(str[...str.firstIndex(of: ".")!])
                    .font(.body)
            }
            .padding(.leading, 5)
            Spacer()
            
        }
        .padding()
        .background(.white, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}
