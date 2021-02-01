//
//  ListExample.swift
//  NavTest
//
//  Created by Alexander Skorulis on 1/2/21.
//

import SwiftUI

struct ListExample: View {
    var body: some View {
        List {
            ForEach(0..<4) { x in
                Text("Item")
            }
        }
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
    }
}
