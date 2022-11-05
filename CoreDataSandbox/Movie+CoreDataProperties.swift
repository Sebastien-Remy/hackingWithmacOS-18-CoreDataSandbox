//
//  Movie+CoreDataProperties.swift
//  CoreDataSandbox
//
//  Created by Sebastien REMY on 05/11/2022.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var title: Int16
    @NSManaged public var year: String?

}

extension Movie : Identifiable {

}
