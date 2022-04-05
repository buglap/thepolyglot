//
//  NoteListViewModel.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import Foundation
import Combine

class NoteListViewModel: ObservableObject {
    @Published var noteViewModels: [NoteViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    @Published var noteRepository = NoteRepository()

    init() {
        noteRepository.$notes.map { notes in
            notes.map(NoteViewModel.init)
        }
        .assign(to: \.noteViewModels, on: self)
        .store(in: &cancellables)
    }

    func add(_ note: Note) {
        noteRepository.add(note)
    }

    func get() {
        noteRepository.get()
    }
}
