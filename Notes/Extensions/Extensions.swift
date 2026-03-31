//
//  Extensions.swift
//  QuickNotes ✨
//
//  Created on 2026.
//

import Foundation
import SwiftUI

// MARK: View

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

