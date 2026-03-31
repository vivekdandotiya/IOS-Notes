//
//  TextEditorView.swift
//  QuickNotes ✨
//
//  Created on 2026.
//

import SwiftUI

struct TextEditorView: View {
    
    @Binding var string: String
    @State var textEditorHeight : CGFloat = 20
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            Text(string)
                .foregroundColor(.clear)
                .padding(14)
                .background(GeometryReader {
                    Color.clear.preference(key: ViewHeightKey.self,
                                           value: $0.frame(in: .local).size.height)
                })
            
            TextEditor(text: $string)
                .frame(height: max(40, textEditorHeight))
                .padding(6)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .scrollContentBackground(.hidden)
            
            if string.isEmpty {
                Text("Write your thoughts...")
                    .font(.body)
                    .foregroundColor(.gray.opacity(0.7))
                    .padding(.top, 14)
                    .padding(.leading, 14)
                    .allowsHitTesting(false)
            }
            
        }.onPreferenceChange(ViewHeightKey.self) { textEditorHeight = $0 }
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}
 
 
 
 
