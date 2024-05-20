//
//  bottomTabView.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 20/05/24.
//

import SwiftUI

struct bottomTabView: View {
    
    @State private var selectedDate: Date = Date()
    
    var body: some View {
        TabView {
            JournalView(selectedDate: $selectedDate)
               .tabItem {
                   Text("Journal")
                   Label("Tab 1", systemImage: "calendar")
               }
               .tag(0)
            HomeView(selectedDate: $selectedDate)
                .tabItem {
                    Text("Lifeline")
                    Label("Tab 2", systemImage: "tree")
                }
                .tag(1)
            MoreView()
                .tabItem {
                    Text("More")
                    Label("Tab 3", systemImage: "square.3.layers.3d.top.filled")
                }
                .tag(2)
            
        }
    }
}

#Preview {
    bottomTabView()
}
