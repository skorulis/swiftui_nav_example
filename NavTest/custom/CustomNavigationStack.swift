//
//  CustomNavigationStack.swift
//  NavTest
//
//  Created by Alexander Skorulis on 8/2/21.
//

import SwiftUI

struct CViewElement {
    let id: String
    let view: AnyView
    
    init<E: View>(view: E, id: String = UUID().uuidString) {
        self.id = id
        self.view = AnyView(view)
    }
}

enum NavigationOperation {
    case push, pop
}

public class CustomNavigationStack: ObservableObject {
    
    @Published private(set) var stack: [CViewElement] = []
    var operation: NavigationOperation = .push
   
    init() {
        let r1 = UIKitRoute.page1
        stack = [CViewElement(view: r1.view, id: r1.id)]
    }
    
    func push(route: UIKitRoute) {
        operation = .push
        stack.append(CViewElement(view: route.view, id: route.id))
    }
    
    func pop() {
        operation = .pop
        if stack.count > 0 {
            stack.removeLast()
        }
    }
    
}
