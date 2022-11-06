//
//  ContentView.swift
//  CoreDataSandbox
//
//  Created by Sebastien REMY on 05/11/2022.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []
//                  predicate: NSPredicate(format: "universe ==  %@", "Star Wars")
//                  predicate: NSPredicate(format: "name <  %@", "F")
//                  predicate: NSPredicate(format: "universe IN %@", ["Alien", "Firefly", "Star Trek"])
    ) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships) { ship in
                Text(ship.name ?? "unknown")
            }
            Button("Show Star Wars") {
                ships.nsPredicate = NSPredicate(format: "universe == %@", "Star Wars")
            }
            Button("Show Star Trek") {
                ships.nsPredicate = NSPredicate(format: "universe == %@", "Star Trek")
            }
            Button("Add exemple") {
                let ship1 = Ship(context: managedObjectContext)
                ship1.name = "Entreprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: managedObjectContext)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: managedObjectContext)
                ship3.name = "Millenium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: managedObjectContext)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? managedObjectContext.save()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
