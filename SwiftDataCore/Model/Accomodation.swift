//
//  Accomodation.swift
//  SwiftDataCore
//
//  Created by Armaghan Asghar on 9/9/24.
//

import Foundation
import SwiftData

@Model
class Accomodation {
    @Attribute(.unique) var name: String
    var Location: String
    @Relationship var trips = [Trip]()
    
    init(name: String, Location: String) {
        self.name = name
        self.Location = Location
    }
}
