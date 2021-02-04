//
//  GeometryExampleView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 2/2/21.
//

import SwiftUI

struct GeometryExampleView: View {
    var body: some View {
        VStack {
            geoBlock
                .border(Color.red)
            innerStack
        }
        .padding()
    }
    
    var geoBlock: some View {
        HStack {
            Text("Test1")
                .frame(maxWidth: .infinity)
                .layoutPriority(0)
            Text("TEx")
                .frame(maxWidth: .infinity)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 4)
                .stroke()
        )
    }
    
    var innerStack: some View {
        HStack {
            Text("P1")
            Text("P2")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 4)
                .stroke()
        )
    }
}

struct GeometryExampleView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryExampleView()
    }
}
