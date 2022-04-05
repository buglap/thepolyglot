//
//  NoteView.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//https://www.raywenderlich.com/11609977-getting-started-with-cloud-firestore-and-swiftui

import SwiftUI

struct NoteView: View {
    var noteViewModel: NoteViewModel
    @State var viewState = CGSize.zero
    @State var showAlert = false

    var body: some View {
        ArticleCardView(urlToImage: noteViewModel.note.urlImage, title: noteViewModel.note.title, description: noteViewModel.note.description, isAdded: true, url: noteViewModel.note.url, didTapSaveArticle: nil)
            .cornerRadius(20)
            .shadow(color: Color(.blue).opacity(0.2), radius: 5, x: 10, y: 10)
            .offset(x: viewState.width, y: viewState.height)
            .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        viewState = value.translation
                    }
                    .onEnded { value in
                        if value.location.x < value.startLocation.x - 40.0 {
                            showAlert.toggle()
                        }
                        viewState = .zero
                    }
            )
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Remove Note"),
                    message: Text("Are you sure you want to remove this note?"),
                    primaryButton: .destructive(Text("Remove")) {
                        noteViewModel.remove()
                    },
                    secondaryButton: .cancel())
            }
    }

    func update(note: Note) {
        noteViewModel.update(note: note)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        let note = Note(id: "", title: "title", url: "", urlImage: "", description: "", observation: "", language: "en", userId: "")
        return NoteView(noteViewModel: NoteViewModel(note: note))
    }
}
