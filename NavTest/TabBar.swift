//
//  TabBar.swift
//  NavTest
//
//  Created by Alexander Skorulis on 30/1/21.
//

import SwiftUI

struct AppTabBar: View {
    
    var body: some View {
        TabView {
            AppRouterView(router: AppRouter())
                .tabItem {
                    Image(systemName: "sun.min")
                    Text("Nav")
                }
            TransitionExample()
                .tabItem {
                    Image(systemName: "moon.fill")
                    Text("Transitions")
                }
        }
    }
    
}

