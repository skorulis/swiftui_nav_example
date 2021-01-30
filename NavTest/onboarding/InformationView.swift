//
//  InformationView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 30/1/21.
//

import SwiftUI

struct InformationView: View {
    
    private var router: OnboardingRouter
    
    init(router: OnboardingRouter) {
        self.router = router
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            Button(action: {
                router.pop()
            }, label: {
                Text("Back")
            })
            
            Button(action: {
                router.trigger(route: OnboardingRoute.page3)
            }, label: {
                Text("Next")
            })
            Spacer()
        }
        
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(router: OnboardingRouter())
    }
}
