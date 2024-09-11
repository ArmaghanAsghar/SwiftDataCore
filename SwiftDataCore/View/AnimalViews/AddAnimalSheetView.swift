//
//  AddAnimalSheetView.swift
//  SwiftDataCore
//
//  Created by Armaghan Asghar on 9/10/24.
//

import SwiftUI

struct AddAnimalSheetView: View {
    
    let animalCategory: AnimalCategory
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    
    @State private var animalName: String = ""
    @State private var animalDiet: Animal.Diet = .carnivorous
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10, content: {
            TextFieldView(textFieldTitle: "Animal Name", textBinding: $animalName)
            TextFieldView(textFieldTitle: animalCategory.name, textBinding: .constant(animalCategory.name))
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            Picker("Animal Diet", selection: $animalDiet) {
                Text("Canivorous").tag(Animal.Diet.carnivorous)
                Text("Herbivorous").tag(Animal.Diet.herbivorous)
                Text("Omnivorous").tag(Animal.Diet.omnivorous)
            }
            .pickerStyle(.palette)
            
            Button(action: saveAnimal, label: {
                Text("Save")
                    .tint(Color.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            
        })
        .padding()
        
    }
    
    private func saveAnimal() {
        let newAnimal = Animal(name: animalName, diet: animalDiet, category: animalCategory)
        modelContext.insert(newAnimal)
        dismiss()
    }
}

//#Preview {
//    AddAnimalSheetView()
//}
