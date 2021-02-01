//
//  LayoutExampleView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 1/2/21.
//

import SwiftUI

struct LayoutExampleView: View {
    
    @State var selected: Int = 0
    
    var body: some View {
        VStack {
            Text("String")
            Rectangle()
                .frame(height: 4)
            
            Picker("Picking", selection: $selected) {
                Text("S1")
                Text("Option2")
                Text("Option3")
                Button(action: {
                    
                }, label: {
                    Text("Button")
                })
            }
        }
    }
}

struct LayoutExampleView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        LayoutExampleView()
    }
}
