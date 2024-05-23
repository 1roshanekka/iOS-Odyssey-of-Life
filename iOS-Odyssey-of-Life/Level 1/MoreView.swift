//
//  MoreView.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 20/05/24.
//

import SwiftUI

struct MoreView: View {
//    @Environment(\.isDarkMode) var isDark
    @AppStorage("isDark") private var isDark: Bool = false
    @State public var morePath = NavigationPath()
    
    var body: some View {

        
        NavigationStack(path: $morePath){
            List{
                Section{
                    NavigationLink(value: 0) {
                        Text("Account")
                    }
                    NavigationLink(value: 1) {
                        Text("Subscribe")
                    }
                    NavigationLink(value: 2){
                        Text("Data")
                    }
                }
                
                Toggle("Appearance", systemImage: isDark ? "sun.max" : "moon.fill" , isOn: $isDark)
    //                .toggleStyle(.button)
                    .contentTransition(.symbolEffect)
                
                
                
                Section{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Log out")
                            .foregroundStyle(.red)
                    })
                }
                
            }
            
            
            .navigationDestination(for: Int.self) { numberValue in
                Text("\(numberValue)")
            }
        }
        
    }
}

//
//#Preview {
//    let selectedDate1 = Date
//    MoreView(selectedDate: selectedDate1)
//}
