//
//  AnimalView.swift
//  SwiftDataCore
//
//  Created by Armaghan Asghar on 9/9/24.
//

import SwiftUI
import SwiftData

struct AnimalCategoryView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var animalCategories: [AnimalCategory]
    
  
    @State private var showAddCategorySheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(animalCategories) { animalCategory in
                    NavigationLink(animalCategory.name) {
                        AnimalListView(animalCategory: animalCategory)
                    }
                }
                .onDelete(perform: deleteCategory)
            }
            .navigationTitle("Categories")
            .toolbar{
                if !animalCategories.isEmpty {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            showAddCategorySheet.toggle()
                        }){
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
            .sheet(isPresented: $showAddCategorySheet, content: {
                AnimalCategorySheetView()
            })
            .overlay {
                if animalCategories.isEmpty {
                    ContentUnavailableView(label: {
                        Label("Ops! No Categories", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("You can add animal categories here")
                    }, actions: {
                        Button(action: {
                            showAddCategorySheet = true
                        }) {
                            Text("Add Category")
                        }
                    })
                    .offset(y: -60)
                }
            }
            
            
        }
    }
    
    
    private func deleteCategory(indexSet: IndexSet) {
        withAnimation {
            for index in indexSet {
                modelContext.delete(animalCategories[index])
            }
        }
    }
}


struct AnimalCategorySheetView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var animalCategoryName: String = ""
    
    var body: some View {
        
        VStack(spacing: 20) {
           TextFieldView(textFieldTitle: "Animal Category",
                         textBinding: $animalCategoryName)
             
            Button(action: saveCategory, label: {
                Text("Save")
                    .tint(Color.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
               
        }
        .padding()
        
    }
    
    private func saveCategory() {
        let animalCategory = AnimalCategory(name: animalCategoryName)
        
        modelContext.insert(animalCategory)
        
        dismiss()
    }
}

#Preview {
    AnimalCategoryView()
        .modelContainer(for: [AnimalCategory.self])
}
