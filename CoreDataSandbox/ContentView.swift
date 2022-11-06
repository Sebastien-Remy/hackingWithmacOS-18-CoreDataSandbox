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

    ) var countries: FetchedResults<Country>
    
    var body: some View {
        List {
            ForEach(countries) { country in
                Section(country.countryFullName) {
                    ForEach(country.countryCandy) {
                        candy in
                        Text(candy.candyName)
                    }
                }
            }
        }
        Button("Add") {
            let fr = Country(context: managedObjectContext)
            fr.fullName = "France"
            fr.shortName = "FR"
            
            let candy1 = Candy(context: managedObjectContext)
            candy1.name = "Mars"
            candy1.origin = Country(context: managedObjectContext)
            candy1.origin?.shortName = "UK"
            candy1.origin?.fullName = "United kingdom"
            
            
            let candy2 = Candy(context: managedObjectContext)
            candy2.name = "Kitkat"
            candy2.origin = Country(context: managedObjectContext)
            candy2.origin?.shortName = "UK"
            candy2.origin?.fullName = "United kingdom"
            
            
            let candy3 = Candy(context: managedObjectContext)
            candy3.name = "Twix"
            candy3.origin = Country(context: managedObjectContext)
            candy3.origin?.shortName = "UK"
            candy3.origin?.fullName = "United kingdom"
            
            
            let candy4 = Candy(context: managedObjectContext)
            candy4.name = "Toblerone"
            candy4.origin = Country(context: managedObjectContext)
            candy4.origin?.shortName = "CH"
            candy4.origin?.fullName = "Switzerland"
            
            let candy5 = Candy(context: managedObjectContext)
            candy5.name = "St Honoré"
            candy5.origin = fr
            
            let candy6 = Candy(context: managedObjectContext)
            candy6.name = "Opéra"
            candy6.origin = fr
            
            try? managedObjectContext.save()
        }
          
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
