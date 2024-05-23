//
//  NoteView.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 20/05/24.
//

import SwiftUI

struct NoteView: View {
    @Binding public var selectedDate: Date
    
    var body: some View {
        Text("\(selectedDate)")
    }
}

#Preview {
    NoteView(selectedDate: .constant(Date()))
}
