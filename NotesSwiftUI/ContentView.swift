//
//  ContentView.swift
//  NotesSwiftUI
//
//  Created by Victor on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var myNotes: MyNotes
    @State var searchString = ""
    @State var newFolderName = ""
    @State var showingPopover = false
    
    var body: some View {
        
       
        ZStack {
        
            NavigationView {
            
            List {
                TextField("Поиск", text: $searchString)
                Section(header:
                    Text("На телефоне")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)) {
                        
                        if (myNotes.folders.count > 0) {
                            FolderCell(name: "Все, на моем телефоне")
                        }
                    
                    ForEach (myNotes.folders) { folder in
                            FolderCell(name: folder.name)
                    }
                }
                .textCase(nil)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Папки")
            .toolbar {
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Изменить") {
                        print("Изменить")
                    }
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Image(systemName: "folder.badge.plus")
                        .onTapGesture {
                            showingPopover.toggle()
                        }
                    Image(systemName: "square.and.pencil")
                        .frame(width: 200, height: 200, alignment: .center)
                    }
                }
            }
            if showingPopover {
                CreateNewFolder($showingPopover, with: myNotes)
            }
        }
    }
}


struct FolderCell: View {
    var name: String
    var body: some View {
        HStack {
            Image(systemName: "folder")
            Text(name)
        }
    }
}

struct CreateNewFolder: View {
    @ObservedObject var myNotes: MyNotes
    @State var newFolderName = ""
    @Binding var showingPopover: Bool
    
    init(_ showingPopover: Binding<Bool>, with myNotes: MyNotes) {
        self._showingPopover = showingPopover
        self.myNotes = myNotes
    }
    
    var body: some View {
        GeometryReader {geo in
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color(.systemGray))
                    .frame(width: geo.size.width * 0.70, height: geo.size.width * 0.40, alignment: .center)
                VStack{
                    Text("Новая папка")
                        .font(.headline)
                    Text("Введите название")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    TextField("Название", text: $newFolderName )
                        .frame(width: 200, height: 10)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(7)
                    
                    Spacer()
                    Color.gray.frame(width: 200, height: CGFloat(1))
                    HStack{
                        Button(action: {
                            print("Отмена")}) {
                                Text("Отмена").frame(maxWidth: .infinity)
                                
                            }
                        Button(action: {
                            myNotes.folders.append(Folder(name: newFolderName))
                            showingPopover.toggle()
                        }) {
                                Text("Сохранить").frame(maxWidth: .infinity)
                                
                            }
                    }
                }
                .frame(width: geo.size.width * 0.70, height: geo.size.width * 0.35)
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let testNotes = MyNotes()
        testNotes.folders = folders
        return ContentView(myNotes: testNotes)
    }
}
