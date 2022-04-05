//
//  NoteViewModel.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import Foundation
import Combine

class NoteViewModel: ObservableObject, Identifiable {

    private let noteRepository = NoteRepository()

    @Published var note: Note
    private var cancellables: Set<AnyCancellable> = []
    var id = ""

    init(note: Note) {
        self.note = note
        $note
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }

    func update(note: Note) {
        noteRepository.update(note)
    }

    func remove() {
        noteRepository.remove(note)
    }
}
