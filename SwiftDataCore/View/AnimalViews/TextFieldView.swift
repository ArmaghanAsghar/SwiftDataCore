//
//  TextFieldView.swift
//  SwiftDataCore
//
//  Created by Armaghan Asghar on 9/10/24.
//

import SwiftUI

struct TextFieldView: View {
    
    let textFieldTitle: String
    @Binding var textBinding: String
    
    var body: some View {
        TextField(textFieldTitle, text: $textBinding)
            .padding(.horizontal, 10)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(height: 50)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TextFieldView(
        textFieldTitle: "Text Field Name",
        textBinding: .constant("Random")
    )
    .padding()
}
