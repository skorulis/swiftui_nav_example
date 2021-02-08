//
//  UIKitRouter.swift
//  NavTest
//
//  Created by Alexander Skorulis on 31/1/21.
//

import SwiftUI

enum UIKitRoute: String {
    case page1
    case page2
    case page3
}

extension UIKitRoute: Identifiable {
    
    var title: String {
        return self.rawValue
    }
    
    var next: UIKitRoute {
        switch self {
        case .page1: return .page2
        case .page2: return .page3
        case .page3: return .page1
        }
    }
    
    var color: Color {
        switch self {
        case .page1: return .blue
        case .page2: return .orange
        case .page3: return .purple
        }
    }
    
    var id: String { rawValue }
    
    @ViewBuilder var view: some View {
        UIKitInnerView(page: self)
    }
    
}

class UIKitRouter: ObservableObject {
    
    @Published var stack:[UIKitRoute] = [.page1]
    
    func push(route: UIKitRoute) {
        stack.append(route)
    }
    
    @objc func pop() {
        if stack.count > 1 {
            stack.removeLast()
        }
    }
    
}

struct UIKitRouterView: View {
    
    @ObservedObject var router: UIKitRouter
    
    init(router: UIKitRouter) {
        self.router = router
    }
    
    var body: some View {
        UIKitNavigationView(router: self.router)
            .environmentObject(router)
    }
    
}

struct UIKitRouterView_Previews: PreviewProvider {
    static var previews: some View {
        let router = UIKitRouter()
        UIKitRouterView(router: router)
    }
}
