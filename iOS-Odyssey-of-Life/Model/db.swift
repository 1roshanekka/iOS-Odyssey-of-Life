//
//  db.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 22/05/24.
//

import SwiftUI

@MainActor
class db: ObservableObject{
    
    @Published var events = [Event]()
    @Published var preview: Bool
    
    init(preview: Bool = true) {
        self.preview = preview
        
        fetchEvents()
    }
    
    func fetchEvents() {
        if preview {
            events = Event.sampleEvents
        } else {
            // load data your persistence store
        }
    }
    
    // CRUD operations
    
    func delete(_ whichEvent: Event) {
        if let index = events.firstIndex(where: {$0.id == whichEvent.id}){
            events.remove(at: index)
        }
    }
    
    func add(_ whichEvent: Event){
        events.append(whichEvent)
    }
    
    func update(_ whichEvent: Event){
        if let index = events.firstIndex(where: {$0.id == whichEvent.id}) {
            events[index].date = whichEvent.date
            events[index].note = whichEvent.note
            
            events[index].eventType = whichEvent.eventType
        }
    }
}
