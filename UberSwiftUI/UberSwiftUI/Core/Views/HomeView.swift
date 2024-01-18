//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by Tomiwa Idowu on 1/17/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
