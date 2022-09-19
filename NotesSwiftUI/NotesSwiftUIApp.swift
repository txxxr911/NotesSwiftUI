//
//  NotesSwiftUIApp.swift
//  NotesSwiftUI
//
//  Created by Victor on 19.09.2022.
//

import SwiftUI

@main
struct NotesSwiftUIApp: App {
    @StateObject private var myNotes = MyNotes()
    var body: some Scene {
        WindowGroup {
            ContentView( myNotes: myNotes)
        }
    }
}
