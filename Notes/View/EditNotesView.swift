//
//  EditNotesView.swift
//  QuickNotes ✨
//
//  Created on 2026.
//

import SwiftUI

struct EditNotesView: View {
    
    @EnvironmentObject var vm: NotesViewModel
    
    @State var note: NoteEntity?
    @State private var title: String = ""
    @State private var content: String = ""
    
    @FocusState private var contentEditorInFocus: Bool

    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                                
                TextField("Title", text: $title, axis: .vertical)
                    .font(.system(.title2, design: .rounded).bold())
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .submitLabel(.next)
                    .onChange(of: title, {
                        guard let newValueLastChar = title.last else { return }
                        if newValueLastChar == "\n" {
                            title.removeLast()
                            contentEditorInFocus = true
                        }
                    })
                    
                TextEditorView(string: $content)
                    .scrollDisabled(true)
                    .font(.body)
                    .focused($contentEditorInFocus)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save Note") {
                    self.updateNote(title: title, content: content)
                    self.hideKeyboard()
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.orange)
                .clipShape(Capsule())
            }
            
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Spacer()
                    Button("Save Note") {
                        self.hideKeyboard()
                        self.updateNote(title: title, content: content)
                    }
                    .font(.body.bold())
                    .foregroundColor(.orange)
                }
            }
        }
        .onAppear {
            
            if let note = note {
                self.title = note.title ?? ""
                self.content = note.content ?? ""
            }
        }
                    
    }
    
    // MARK: Core Data Operations

    func updateNote(title: String, content: String) {
        
        if (title.isEmpty) && (content.isEmpty) {
            return
        }
        
        guard let note = note else { return }
        
        vm.updateNote(note, title: title, content: content)
    }
}
