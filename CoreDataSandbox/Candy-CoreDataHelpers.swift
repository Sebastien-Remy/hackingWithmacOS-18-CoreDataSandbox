//
//  Candy-CoreDataHelpers.swift
//  CoreDataSandbox
//
//  Created by Sebastien REMY on 06/11/2022.
//

import Foundation

extension Candy {
    var candyName: String {
        name ?? "Unknown candy"
    }
}

extension Country {
    var countryShortName: String {
        shortName ?? "Unknown Country"
    }
    
    var countryFullName: String {
        fullName ?? "Unknown Country"
    }
    
    var countryCandy: [Candy] {
        let set = candy as? Set<Candy> ?? []
        return set.sorted {
            $0.candyName < $1.candyName
        }
    }
}
