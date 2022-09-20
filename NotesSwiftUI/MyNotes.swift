//
//  MyNotes.swift
//  NotesSwiftUI
//
//  Created by Victor on 19.09.2022.
//

import Foundation

class MyNotes: ObservableObject {
    
    @Published var folders = [Folder]()
}

struct Folder: Identifiable {
    var id = UUID()
    var name: String
}

struct Note: Identifiable {
    var id = UUID()
    var tittle: String
    var noteText: String
}

var folders = [
    Folder(name: "Folder1"),
    Folder(name: "Folder2")
]

var testNotes = [
    Note(tittle: "Заметка 1", noteText: "Текст заметки 1"),
    Note(tittle: "Заметка 2", noteText: "Текст заметки 2")
]
