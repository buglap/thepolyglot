//
//  NoteRepository.swift
//  ThePolyglot
//
//  Created by Jenny escobar on 4/04/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine
import GoogleSignIn

class NoteRepository: ObservableObject {

    private let path: String = "notes"
    private let store = Firestore.firestore()

    @Published var notes: [Note] = []

    var userId = ""
    private let user = GIDSignIn.sharedInstance.currentUser

    init() {
        userId = user?.userID ?? ""
        self.get()
    }

    func get() {
        store.collection(path)
            .whereField("userId", isEqualTo: userId)
            // .whereField("language", isEqualTo: SearchNewsViewModel.shared.currentSelectedLanguage)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting cards: \(error.localizedDescription)")
                    return
                }
                self.notes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: Note.self)
                } ?? []
            }
    }

    func add(_ note: Note) {
        do {
            var newNote = note
            newNote.userId = userId
            _ = try store.collection(path).addDocument(from: newNote)
        } catch {
            fatalError("Unable to add note: \(error.localizedDescription).")
        }
    }

    func update(_ note: Note) {
        guard let noteId = note.id else { return }
        do {
            try store.collection(path).document(noteId).setData(from: note)
        } catch {
            fatalError("Unable to update note: \(error.localizedDescription).")
        }
    }

    func remove(_ note: Note) {
        guard let noteId = note.id else { return }

        store.collection(path).document(noteId).delete { error in
            if let error = error {
                print("Unable to remove note: \(error.localizedDescription)")
            }
        }
    }
}
