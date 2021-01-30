//
//  TextView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 29/1/21.
//

import SwiftUI

struct DummyView: View {
    
    let routeItem: RouteItem
    @EnvironmentObject var router: AppRouter
    
    init(routeItem: RouteItem) {
        self.routeItem = routeItem
    }
    
    var body: some View {
        VStack {
            Text(routeItem.title)
            Button(action: {
                if let next = routeItem.next {
                    router.trigger(route: next)
                }
                print("Go to next")
            }, label: {
                Text("Next")
            }).padding()
        }
    }
}
