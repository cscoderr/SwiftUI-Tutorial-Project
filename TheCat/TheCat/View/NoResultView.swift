//
//  NoResultView.swift
//  TheCat
//
//  Created by Tomiwa Idowu on 20/01/2023.
//

import SwiftUI

struct NoResultView: View {
    
    @Binding var query: String
    
    var body: some View {
        Text("Unable to get your result: \(query)")
    }
}

struct NoResultView_Previews: PreviewProvider {
    static var previews: some View {
        NoResultView(query: .constant("Test"))
    }
}
