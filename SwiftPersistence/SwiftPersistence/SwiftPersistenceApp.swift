//
//  SwiftPersistenceApp.swift
//  SwiftPersistence
//
//  Created by Mac on 01/10/2023.
//

import SwiftUI
import SwiftData

@main
struct SwiftPersistenceApp: App {
    let container: ModelContainer? = {
        let schema = Schema([Expense.self])
        let config = ModelConfiguration()
        let container = try? ModelContainer(for: schema, configurations: config)
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Expense.self])
    }
}
