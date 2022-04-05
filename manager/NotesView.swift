//
//  NotesView.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var searchNewsViewModel: SearchNewsViewModel = SearchNewsViewModel.shared
    @ObservedObject var noteListViewModel = NoteListViewModel()
    @State var showForm = false
    var body: some View {
        VStack {
            HStack {
                PickerView(mapChoioceString: $searchNewsViewModel.currentSelectedLanguage, settings: searchNewsViewModel.availableLanguages)
                Spacer()
                Button(action: {
                    showForm.toggle()
                }, label: {
                    Image(systemName: "plus.circle.fill").foregroundColor(Color(.systemIndigo))
                })
            }.padding()
            VStack {
                Text("Add something you wanna review later.")
            }
            VStack(alignment: .leading) {
                ScrollView(.vertical) {
                    VStack(spacing: 4) {
                        ForEach(noteListViewModel.noteViewModels) { noteViewModel in
                            NoteView(noteViewModel: noteViewModel)
                        }
                    }
                }
            }.popup(isPresented: $showForm) {
                NewNoteForm(noteListViewModel: NoteListViewModel(), isPresented: $showForm, language: $searchNewsViewModel.currentSelectedLanguage)
            }
            Spacer()
        }.padding(.bottom, 40)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
