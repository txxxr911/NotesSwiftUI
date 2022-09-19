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

var folders = [
Folder(name: "Folder1"),
Folder(name: "Folder2")
]
