//
//  AnimalView.swift
//  SwiftDataCore
//
//  Created by Armaghan Asghar on 9/9/24.
//

import SwiftUI
import SwiftData

struct AnimalView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var animalCategories: [AnimalCategory]
    
  
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(animalCategories) { animalCategory in
                    NavigationLink(animalCategory.name) {
                        Text("Sub")
                        // Add logic for adding animals
                        // to categories
                    }
                }
                .onDelete(perform: deleteCategory)
            }
            .navigationTitle("Categories")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showSheet.toggle()
                    }){
                       Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showSheet, content: {
                AnimalCategorySheetView()
            })
            
            
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
            TextField("Animal Category", text: $animalCategoryName)
                .padding(.horizontal, 10)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 50)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
             
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
    AnimalView()
        .modelContainer(for: [AnimalCategory.self])
}
