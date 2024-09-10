//
//  Animal.swift
//  SwiftDataCore
//
//  Created by Armaghan Asghar on 9/9/24.
//

import Foundation
import SwiftData


@Model
final class AnimalCategory {
    @Attribute(.unique) var name: String
    
    // The category may contain none or many
    // .cascade relationship means delete all instances of animal when category is deleted.
    // .inverse forms the relationship between the two models.
    @Relationship(deleteRule: .cascade, inverse: \Animal.category) var animals = [Animal]()
    
    init(name: String, animals: [Animal] = [Animal]()) {
        self.name = name
        self.animals = animals
    }
}

@Model
final class Animal {
    var name: String
    var diet: Diet
    var category: AnimalCategory?
    
    
    init(name: String, diet: Diet, category: AnimalCategory) {
        self.name = name
        self.diet = diet
        self.category = category
    }
}


extension Animal {
    enum Diet: String, Codable {
        case herbivorous = "Herbivore"
        case carnivorous = "Carnivore"
        case omnivorous = "Omnivore"
    }
}

