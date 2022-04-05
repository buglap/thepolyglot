//
//  Note.swift
//  manager
//
//  Created by Jenny escobar on 13/12/21.
//
import Foundation
import FirebaseFirestoreSwift

struct Note: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var url: String
    var urlImage: String
    var description: String
    var observation: String?
    var language: String
    var userId: String?
}
