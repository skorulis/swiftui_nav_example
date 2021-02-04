//
//  TabBar.swift
//  NavTest
//
//  Created by Alexander Skorulis on 30/1/21.
//

import SwiftUI

struct SeparatedViewExample: View {
    var body: some View {
        SeparatedView {
            ForEach(0..<5) { x in
                Text("TEST \(x)")
            }
            Text("TEST")
            Text("TEST2")
        }
    }
}

struct AppTabBar: View {
    
    var body: some View {
        TabView {
            AppRouterView(router: AppRouter())
                .tabItem {
                    Image(systemName: "sun.min")
                    Text("Nav")
                }
            UIKitRouterView(router: UIKitRouter())
                .tabItem {
                    Text("UIKit")
                }
            /*TransitionExample()
                .tabItem {
                    Image(systemName: "moon.fill")
                    Text("Transitions")
                }*/
            NavStackView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Basic nav")
                }
                .environmentObject(OnboardingRouter())
            SimpleNav()
                .tabItem {
                    Text("Simple")
                }
            FormExampleView()
                .tabItem { Text("Form") }
            SeparatedViewExample()
                .tabItem { Text("Separated View") }
            GeometryExampleView()
                .tabItem { Text("Geometry example") }
        }
    }
    
}

