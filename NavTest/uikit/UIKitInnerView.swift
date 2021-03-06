//
//  UIKitInnerView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 31/1/21.
//

import SwiftUI

struct UIKitInnerView: View {
    
    private let page: UIKitRoute
    //@EnvironmentObject var router: UIKitRouter
    @EnvironmentObject var router: CustomNavigationStack
    
    init(page: UIKitRoute)  {
        self.page = page
    }
    
    var body: some View {
        ScrollView {
            Button(action: {
                print("Next")
                router.push(route: page.next)
            }, label: {
                Text("Next page")
            })
            Text("This is page \(page.rawValue)")
            Rectangle()
                .frame(height: 50)
                .foregroundColor(page.color)
            Spacer(minLength: 200)
            Text("Some content at the middle of the page")
            Spacer(minLength: 400)
            Text("Some content at the bottom of the page that should wrap over multiple lines")
        }
        
    }
    
}

