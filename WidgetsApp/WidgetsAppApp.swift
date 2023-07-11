//
//  WidgetsAppApp.swift
//  WidgetsApp
//
//  Created by Ragul Lakshmanan on 11/07/23.
//

import SwiftUI

@main
struct WidgetsAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WidgetView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
