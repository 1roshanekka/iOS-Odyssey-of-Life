//
//  HomeView.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 20/05/24.
//

import SwiftUI

struct HomeView: View {
    @Binding public var selectedDate: Date 
    
    var body: some View {
        VStack{
            Text("home")
            Text("Selected date: \(selectedDate.formatted(date: .abbreviated, time: .omitted))")
        }
    }
}
//
//#Preview {
//    HomeView(path: NavigationPath())
//}
