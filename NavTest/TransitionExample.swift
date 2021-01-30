//
//  TransitionExample.swift
//  NavTest
//
//  Created by Alexander Skorulis on 30/1/21.
//

import SwiftUI

struct TransitionExample: View {
    
    @State var toggleOn: Bool
    
    init() {
        self._toggleOn = State(initialValue: false)
    }
    
    var body: some View {
        VStack {
            Toggle(isOn: $toggleOn) {
                Text("Show view")
            }
            if toggleOn {
                Text("Toggle  item")
                    .animation(.easeOut)
                    .transition(.moveAndFade)
            }
            Spacer()
        }
        
    }
}

struct TransitionExample_Previews: PreviewProvider {
    static var previews: some View {
        TransitionExample()
    }
}
