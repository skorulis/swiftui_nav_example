//
//  NavStackView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 30/1/21.
//

import SwiftUI

struct ProgramaticLink<Destination> : View where Destination : View {
    
    private let destination: Destination
    @Binding var isActive: Bool
    
    init(destination: Destination, isActive: Binding<Bool>) {
        self.destination = destination
        self._isActive = isActive
    }
    
    var body: some View {
        NavigationLink(
            destination: destination,
            isActive: $isActive,
            label: { EmptyView() }
        )
    }
    
}

struct NavStackView: View {
    
    @EnvironmentObject var router: OnboardingRouter
    
    var page3: some View {
        SimplePage()
            .navigationTitle("Page3")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button("Back2", action: {router.pop()}))
            
    }
    
    var page2: some View {
        ZStack {
            OnboardingView(route: .page2)
            ProgramaticLink(destination: page3, isActive: router.isActive(.page3))
                .navigationBarItems(leading: Button("Back3", action: {router.pop()}))
        }
        .navigationTitle("Page2")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button("Back1", action: {router.pop()}))
    }
    
    var page1: some View {
        ZStack {
            OnboardingView(route: .page1)
            ProgramaticLink(destination: page2, isActive: router.isActive(.page2))
        }
        .navigationTitle("Page1")
    }
    
    var body: some View {
        NavigationView {
            page1
            
        }
        
        
    }
}

struct NavStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavStackView()
            .environmentObject(OnboardingRouter())
    }
}
