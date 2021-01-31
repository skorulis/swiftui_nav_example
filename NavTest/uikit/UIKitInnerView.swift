//
//  UIKitInnerView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 31/1/21.
//

import SwiftUI

struct UIKitInnerView: View {
    
    private let page: UIKitRoute
    @EnvironmentObject var router: UIKitRouter
    
    init(page: UIKitRoute)  {
        self.page = page
    }
    
    
    var body: some View {
        Button(action: {
            print("Next")
            router.push(route: page.next)
        }, label: {
            Text("Next page")
        })
    }
    
}

