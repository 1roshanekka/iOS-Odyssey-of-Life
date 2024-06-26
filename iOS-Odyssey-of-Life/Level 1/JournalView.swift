//
//  JournalView.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 20/05/24.
//

import SwiftUI

struct JournalView: View {
    @EnvironmentObject var dataBase: db
    
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false 
    @State private var navigateToEditNoteView = false
    
    @Binding public var selectedDate: Date
    @State private var journalPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $journalPath) {
//            VStack{
//                DatePicker(selection: $selectedDate, displayedComponents: .date) {
//                    Text("pick a date")
//                }
//                .datePickerStyle(.graphical)
//                Button(action: {
//                    print("pressed today")
//                    selectedDate = Date.now
//                }, label: {
//                    Text("Today")
//                })
//                
////                Text("\($selectedDate)")
////                Text("\(selectedDate, formatter: .date)")
//                Text("Selected date: \(selectedDate.formatted(date: .abbreviated, time: .omitted))")
//            }
            ScrollView{
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture), dataBase: dataBase, dateSelected: $dateSelected, displayEvents: $displayEvents)
            }
            .onChange(of: dateSelected) { newValue in
                if newValue != nil {
                    navigateToEditNoteView = true
                }
            }
            NavigationLink(destination: EditNoteView(dateSelected: $dateSelected), isActive: $navigateToEditNoteView) {
                EmptyView()
            }
            .navigationTitle("Odyssey")
        }
    }
}

//#Preview {
//    JournalView(selectedDate: .constant(Date))
//}
