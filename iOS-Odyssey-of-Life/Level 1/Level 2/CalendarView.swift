//
//  CalendarView.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 22/05/24.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    
    let interval: DateInterval
    @ObservedObject var dataBase: db
    @Binding var dateSelected: DateComponents?
    @Binding var displayEvents: Bool
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView() 
        view.delegate = context.coordinator
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, dataBase: _dataBase)
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
   
    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate{
        
        var parent: CalendarView
        @ObservedObject var dataBase: db
        
        init(parent: CalendarView, dataBase: ObservedObject<db>) {
            self.parent = parent
            self._dataBase = dataBase
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            
            let foundEvents = dataBase.events
                .filter { $0.date.startOfDay == dateComponents.date?.startOfDay }
            if foundEvents.isEmpty{
                return nil
            }
            if foundEvents.count > 1{
                return .image(UIImage(systemName: "doc.on.doc.fill"),
            color: .red, size: .large)
            }
            let singleEvent = foundEvents.first!
            return .customView{
                let icon = UILabel()
                icon.text = singleEvent.eventType.icon
                return icon
            }
        }
        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            parent.dateSelected = dateComponents
            guard let dateComponents else { return }
            let foundEvents = dataBase.events
                .filter { $0.date.startOfDay == dateComponents.date?.startOfDay }
            if !foundEvents.isEmpty {
                parent.displayEvents.toggle()
            }
            
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
    }
}
