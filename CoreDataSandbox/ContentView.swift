//
//  ContentView.swift
//  CoreDataSandbox
//
//  Created by Sebastien REMY on 05/11/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards) { wizard in
                Text(wizard.name ?? "unknown")
            }
            Button("Add") {
                let wizar = Wizard(context: managedObjectContext)
                wizar.name = "Harry Potter"
            }
            Button("Save") {
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
