//
//  AnimationTestView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 8/2/21.
//

import SwiftUI

struct AnimationTestView: View {
    
    @State var topAnimState: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    topView
                        .animation(.easeIn)
                    Toggle("Change animation", isOn: $topAnimState)
                }
            }
        }
    }
    
    @ViewBuilder
    var topView: some View {
        if topAnimState {
            Rectangle()
                .foregroundColor(Color.blue)
                .frame(height: 30)
                .transition(.move(edge: .leading))
        } else {
            EmptyView()
            Rectangle()
                .foregroundColor(Color.red)
                .frame(height: 30)
                .transition(.move(edge: .trailing))
        }
        
    }
    
    var blueTransition: AnyTransition {
        return topAnimState ? .move(edge: .leading) : .opacity //.move(edge: .trailing)
    }
    
}
