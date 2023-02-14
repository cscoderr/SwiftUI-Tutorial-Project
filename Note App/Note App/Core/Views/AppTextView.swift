//
//  AppTextView.swift
//  Note App
//
//  Created by Tomiwa Idowu on 05/02/2023.
//

import SwiftUI

struct AppTextView: View {
    @Binding var binding: String
    var label: String
    var isDescriptionField: Bool
    
    var body: some View {
        TextField(label, text: $binding, axis: .vertical)
            .disableAutocorrection(true)
            .lineLimit(isDescriptionField ? 3 : 1, reservesSpace: isDescriptionField)
            .padding()
            .background(.gray.opacity(0.2), in:RoundedRectangle(cornerRadius: 6, style: .continuous))
            .padding(.bottom, 15)
    }
}

struct AppTextView_Previews: PreviewProvider {
    static var previews: some View {
        AppTextView(
            binding: .constant("title"), label: "Title", isDescriptionField: true
        )
        .padding()
    }
}
