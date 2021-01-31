//
//  SimpleNav.swift
//  NavTest
//
//  Created by Alexander Skorulis on 30/1/21.
//

import SwiftUI

struct SimpleNav: View {
    
    var page3: some View {
        Text("Page 3 is here")
            .navigationTitle("Page3")
            .navigationBarItems(leading: Text("Page3"))
    }
    
    var page2: some View {
        NavigationLink(
            destination: page3,
            label: {
                Text("Page 3")
            })
            .navigationTitle("Page2")
            .navigationBarItems(leading: Text("Page2"))
    }
    
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: page2,
                label: {
                    Text("Page 2")
                })
                .navigationTitle("Page1")
        }
        
    }
}

struct SimpleNav_Previews: PreviewProvider {
    static var previews: some View {
        SimpleNav()
    }
}
