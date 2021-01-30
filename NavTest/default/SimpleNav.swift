//
//  SimpleNav.swift
//  NavTest
//
//  Created by Alexander Skorulis on 30/1/21.
//

import SwiftUI

struct SimpleNav: View {
    
    var page2: some View {
        VStack {
            Text("String")
        }
    }
    
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: page2,
                label: {
                    Text("Page 2")
                })
            Button(action: {
                
            }, label: {
                Text("Page 1")
            })
        }
        
    }
}

struct SimpleNav_Previews: PreviewProvider {
    static var previews: some View {
        SimpleNav()
    }
}
