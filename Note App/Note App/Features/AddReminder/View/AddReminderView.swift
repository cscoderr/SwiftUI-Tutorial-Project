//
//  AddReminderView.swift
//  Note App
//
//  Created by Tomiwa Idowu on 30/01/2023.
//

import SwiftUI

struct AddReminderView: View {
    @Environment(\.dismiss) var dimiss
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var currentIndex = 0
    @Environment(\.managedObjectContext) var note
//    @State var selectedColor: Color
    @State private var colors: [UIColor] = [
        .red,
        .green,
        .orange,
        .purple,
        .brown,
        .yellow,
        .gray,
        .blue
    ]
    var body: some View {
        NavigationView {
            VStack {
              AppTextView(
                binding: $title, label: "Title",
                isDescriptionField: false
              )
                AppTextView(
                  binding: $description, label: "Decription",
                  isDescriptionField: true
                )
                ColorPickerView(
                    colors: colors,
                    currrentIndex: $currentIndex
//                    selectedColor: $selectedColor
                )
                Spacer()
                
                Button {
                    let selectedColor: UIColor = colors[currentIndex]
                    let currentNote = NoteList(context: note)
                    currentNote.id = UUID()
                    currentNote.title = title
                    currentNote.content = description
                    currentNote.color = selectedColor.encode()
                    try? note.save()
                    dimiss()
                } label: {
                    Text("Submit")
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
                
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add Note")
            .frame(maxHeight: .infinity, alignment: .top)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dimiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .tint(.black)

                }
                
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Done") {
//                        dimiss()
//                    }
//                    .tint(.black)
//
//                }
                
            }
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
    }
}


extension UIColor {
        
     func color(data:Data) -> UIColor? {
          return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
     }

     func encode() -> Data? {
          return try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
     }
}
