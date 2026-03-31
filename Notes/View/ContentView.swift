//
//  ContentView.swift
//  QuickNotes ✨
//
//  Created on 2026.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notesViewModel: NotesViewModel

    var body: some View {
        
        Group {
            if notesViewModel.isDataLoaded {
                NotesView()
            } else {
                ProgressView("Loading...")
            }
        }
    }
}
 
 
 
 
 
