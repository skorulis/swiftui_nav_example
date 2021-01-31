//
//  UIKitNavigationView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 31/1/21.
//
import SwiftUI
import UIKit

struct UIKitNavPage {
    
    let page: AnyView
    let title: String
}

struct UIKitNavigationView: UIViewControllerRepresentable {
    @ObservedObject var router: UIKitRouter

    private func mapRoute(route: UIKitRoute, showBack: Bool) -> UIHostingController<AnyView> {
        let host = UIHostingController(rootView: AnyView(route.view))
        host.title = route.title
        host.navigationItem.hidesBackButton = true
        if showBack {
            host.navigationItem.leftBarButtonItem = SwiftBarButtonItem(title: "Back", style: .plain, actionHandler: { _ in
                self.router.pop()
            })
        }
        
        return host
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let hosting = mapRoute(route: router.stack[0], showBack: false)
        let navController = UINavigationController(rootViewController: hosting)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }

    func updateUIViewController(_ navController: UINavigationController, context: Context) {
        if navController.viewControllers.count == router.stack.count + 1 {
            navController.popViewController(animated: true)
        } else if navController.viewControllers.count == router.stack.count - 1 {
            let next = mapRoute(route: router.stack.last!, showBack: true)
            navController.pushViewController(next, animated: true)
        } else {
            let pageControllers = router.stack.enumerated().map { (index,  element) -> UIHostingController<AnyView> in
                return mapRoute(route: element, showBack: index > 0)
            }
            navController.viewControllers = pageControllers
        }
        
        print("Update")
    }
    
}
