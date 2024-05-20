//
//  TabView.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 20/05/24.
//

import SwiftUI

struct TabView: View {
    
    @State public var path = NavigationPath()
    
    var body: some View {
        TabView{
            
            NavigationStack {
                           VStack {
                               Text("Another Tab")
                           }
                       }
                       .tabItem {
                           Label("Another Tab", systemImage: "square.and.pencil")
                       }
                       .tag(2)
        }
    }
}

#Preview {
    TabView()
}
