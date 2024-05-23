//
//  iOS_Odyssey_of_LifeApp.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 19/05/24.
//

import SwiftUI
import SwiftData

@main
struct iOS_Odyssey_of_LifeApp: App {
    @AppStorage("isDark") private var isDark = true
    
    @StateObject var memories = db(preview: true)
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(memories)
//                .environment(\.isDarkMode, isDark)
                .preferredColorScheme( isDark ? .dark : .light) // or `.light or` `nil` to use the current scheme
        }
        .modelContainer(sharedModelContainer)
    }
}
