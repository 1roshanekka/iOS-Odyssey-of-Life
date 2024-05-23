//
//  EditNoteView.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 23/05/24.
//

import SwiftUI

struct EditNoteView: View {
    @EnvironmentObject var dataBase: db
    @Binding var dateSelected: DateComponents?
    
    var body: some View {
        Text("\(String(describing: dateSelected))")
    }
}
