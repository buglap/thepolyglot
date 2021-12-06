//
//  managerApp.swift
//  manager
//
//  Created by Jenny escobar on 29/11/21.
//

import SwiftUI

@main
struct managerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
            //    .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
