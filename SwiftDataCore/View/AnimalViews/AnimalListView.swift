//
//  AddAnimalView.swift
//  SwiftDataCore
//
//  Created by Armaghan Asghar on 9/10/24.
//

import SwiftUI
import SwiftData

struct AnimalListView: View {
    
    // todo: Make the animals list alphabetical.
    @State var showAddAnimalSheet: Bool = false
    @Query var animals: [Animal]
    @Environment(\.modelContext) private var modelContext
    let animalCategory: AnimalCategory
    
    
    var body: some View {
        
        List {
            ForEach(animals) { animal in
                Text(animal.name)
            }
            .onDelete(perform: deleteAnimal)
        }
        .navigationTitle(animalCategory.name)
        .sheet(isPresented: $showAddAnimalSheet){
            AddAnimalSheetView(animalCategory: animalCategory)
        }
        .toolbar {
            if !animals.isEmpty {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    EditButton()
                    Button(action: {
                        showAddAnimalSheet.toggle()
                    }, label: {
                        Label("Add Item", systemImage: "plus")
                    })
                }
                
                
            }
        }
        .overlay {
            if animals.isEmpty {
                ContentUnavailableView(label: {
                    Label("Oye! No Animals",
                          systemImage: "list.bullet.rectangle.portrait")
                }, description: {
                    Text("You can add animals to the selected category here!")
                }, actions: {
                    Button(action: {
                        showAddAnimalSheet.toggle()
                    }) {
                        Text("Add Animal")
                    }
                })
            }
        }
        
    }
    
    private func deleteAnimal(indexSet: IndexSet) {
        withAnimation {
            for index in indexSet {
                modelContext.delete(animals[index])
            }
        }
    }
}
   
    
    
   

