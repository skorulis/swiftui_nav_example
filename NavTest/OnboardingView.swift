//
//  OnboardingView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 29/1/21.
//

import SwiftUI

struct OnboardingView: View {
    
    let route: OnboardingRoute
    @EnvironmentObject var router: OnboardingRouter
    
    init(route: OnboardingRoute) {
        self.route = route
    }
    
    var body: some View {
        VStack {
            Text(route.title)
            Button(action: {
                if let next = route.next {
                    router.trigger(route: next)
                }
            }, label: {
                Text("Next press")
            })
        }
    }
}
