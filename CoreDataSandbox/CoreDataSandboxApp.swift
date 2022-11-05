//
//  CoreDataSandboxApp.swift
//  CoreDataSandbox
//
//  Created by Sebastien REMY on 05/11/2022.
//

import SwiftUI

@main
struct CoreDataSandboxApp: App {
    @StateObject var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataController)
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.willTerminateNotification)) { _ in
                    dataController.save()
                }
        }
    }
}
