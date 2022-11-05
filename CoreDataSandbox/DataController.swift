//
//  DataController.swift
//  Bookworm
//
//  Created by Sebastien REMY on 05/11/2022.
//

import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "CoreDataSandbox") // must match the name in model!
    var saveTask: Task<Void, Error>?
    
    init() {
        container.loadPersistentStores { descritption, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            
            // Ask core data to merge duplicate object based on their properties
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        }
    }
    
    func save() {
        guard container.viewContext.hasChanges else { return }
        try? container.viewContext.save()
    }
    
    func enqueueSave(_ change: Any) {
        saveTask?.cancel()
        
        saveTask = Task {
            @MainActor in
            try await Task.sleep(for: .seconds(5))
            save()
        }
    }
}
