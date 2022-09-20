//
//  NoteView.swift
//  NotesSwiftUI
//
//  Created by Victor on 20.09.2022.
//

import SwiftUI

struct NoteView: View {
    @State var title = ""
    @State var noteText = "Какой-то текст для тестовой заметки аовлалфжыаоыашзоываолвыфафаа"
    var body: some View {
        TextView(text: $noteText)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Готово") {
                        print ("ready")
                    }
                }
            }
    }
}

struct TextView : UIViewRepresentable {
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = context.coordinator.updateAttributedString()
    }
    
    class Coordinator: NSObject {
        var parent: TextView
        
        init (_ textView: TextView) {
            self.parent = textView
        }
        
        func updateAttributedString() -> NSAttributedString {
            let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle)]
            let attrString = NSAttributedString(string: parent.text, attributes: attrs)
            return attrString
        }
    }
    
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
