//
//  Trip.swift
//  SwiftDataCore
//
//  Created by Armaghan Asghar on 9/9/24.
//

import Foundation
import SwiftData

@Model
class Trip {
    @Attribute(.unique) var name: String
    var destination: String
    var startDate: Date
    var endDate: Date
    @Relationship var accomodation: Accomodation?
    
    init(name: String, destination: String, startDate: Date, endDate: Date, accomodation: Accomodation? = nil) {
        self.name = name
        self.destination = destination
        self.startDate = startDate
        self.endDate = endDate
        self.accomodation = accomodation
    }
}
