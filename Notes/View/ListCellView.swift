//
//  ListCellView.swift
//  QuickNotes ✨
//
//  Created on 2026.
//

import SwiftUI

struct ListCellView: View {
    var note: NoteEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(note.title ?? "New Note")
                .lineLimit(1)
                .font(.headline)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(note.content ?? "No context available")
                .lineLimit(2)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 8)
    }
}
 
 
 
