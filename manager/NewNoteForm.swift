//
//  NewNoteForm.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import SwiftUI

struct NewNoteForm: View {
    @State var title: String = ""
    @State var description: String = ""
    @State var urlImage: String = ""
    @State var url: String = ""
    @ObservedObject var noteListViewModel: NoteListViewModel
    @Binding var isPresented: Bool
    @Binding var language: String
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Image(systemName: "xmark").foregroundColor(.black)
                    })
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Title").foregroundColor(.black)
                    TextField("Enter a title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Image url").foregroundColor(.black)
                    TextField("", text: $urlImage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Url").foregroundColor(.black)
                    TextField("", text: $url)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description").foregroundColor(.black)
                    TextField("", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button(action: addNote) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding().background(Color(.systemIndigo))
                        .cornerRadius(12).padding(30)
                }
            }.padding(20).frame(width: 330, height: 450)
                .background(Color.white).border(.black).shadow(color: .gray, radius: 2, y: -1)
                .cornerRadius(16)
                .padding()
        }
    }

    private func addNote() {
        if title.count > 4 && url.count > 10 {
            let note = Note(title: title, url: url, urlImage: urlImage, description: description, language: language)
            noteListViewModel.add(note)
            isPresented = false
        }
    }
}

struct NewNoteForm_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteForm(noteListViewModel: NoteListViewModel(), isPresented: .constant(true), language: .constant("en"))
    }
}
