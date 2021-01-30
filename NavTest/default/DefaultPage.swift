//
//  DefaultPage.swift
//  NavTest
//
//  Created by Alexander Skorulis on 30/1/21.
//

import SwiftUI

struct DefaultPage: ViewModifier {
    
    private var router: PRouter
    
    init(router: PRouter) {
        self.router = router
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarItems(leading: Button(action: {
                router.pop()
            }, label: {
                Text("Back")
            }))
    }
}
