//
//  CustomNavigationView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 31/1/21.
//

import SwiftUI
import Combine


struct CustomNavigationView: View {
    
    @ObservedObject var router: CustomNavigationStack
    
    init(router: CustomNavigationStack) {
        self.router = CustomNavigationStack()
    }
    
    var body: some View {
        NavigationView {
            innerView
                .transition(.move(edge: .leading))
        }
        
        .environmentObject(router)
        
    }
    
    @ViewBuilder
    var innerView: some View {
        let element = router.stack.last!
        element.view
            .id(element.id)
            .navigationBarItems(leading: backButton)
            
    }
    
    @ViewBuilder
    private var backButton: some View {
        if router.stack.count > 1 {
            Button("Back", action: {
                withAnimation {
                    router.pop()
                }
            })
        } else {
            EmptyView()
        }
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(router: CustomNavigationStack())
    }
}
