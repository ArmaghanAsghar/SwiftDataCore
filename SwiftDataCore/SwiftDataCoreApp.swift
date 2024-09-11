//
//  SwiftDataCoreApp.swift
//  SwiftDataCore
//
//  Created by Armaghan Asghar on 9/9/24.
//

import SwiftUI
import SwiftData

@main
//struct SwiftDataCoreApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//}


// This is a working example for the Animal Model
struct SwiftDataCoreApp: App {
    var body: some Scene {
        WindowGroup {
            AnimalCategoryView()
        }
        .modelContainer(for: [AnimalCategory.self])
    }
}
