//
//  JournalView.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 20/05/24.
//

import SwiftUI

struct JournalView: View {
    @Binding public var selectedDate: Date
    @State private var journalPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $journalPath) {
            VStack{
                DatePicker(selection: $selectedDate, displayedComponents: .date) {
                    Text("pick a date")
                }
                .datePickerStyle(.graphical)
                Button(action: {
                    print("pressed today")
                    selectedDate =n Date.now
                }, label: {
                    Text("Today")
                })
                
//                Text("\($selectedDate)")
//                Text("\(selectedDate, formatter: .date)")
                Text("Selected date: \(selectedDate.formatted(date: .abbreviated, time: .omitted))")
            }
            .padding(20)
            .navigationTitle("Odyssey")
        }
    }
}

//#Preview {
//    JournalView(selectedDate: .constant(Date))
//}
