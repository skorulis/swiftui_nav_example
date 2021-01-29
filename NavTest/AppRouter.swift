//
//  AppRouter.swift
//  NavTest
//
//  Created by Alexander Skorulis on 29/1/21.
//

import SwiftUI

protocol RouteItem {
    
    var title: String { get }
    var next: RouteItem? { get }
}

protocol Router {
    func trigger(route: RouteItem)
    
}

enum AppRoute: String, RouteItem {
    case landing
    case onboarding
    case dashboard
    
    var title: String {
        return rawValue
    }
    
    var next: RouteItem? {
        switch self {
        case .landing:
            return AppRoute.onboarding
        case .onboarding:
            return AppRoute.dashboard
        case .dashboard:
            return nil
            
        }
    }
}

class AppRouter: ObservableObject, Router {
    @Published var current: AppRoute = .landing
    
    func trigger(route: RouteItem) {
        current = route as! AppRoute
    }

}

struct AppRouterView: View {
    
    @ObservedObject var router: AppRouter
    
    init(router: AppRouter) {
        self.router = router
    }
    
    var body: some View {
        Group {
            switch router.current {
            case .landing:
                DummyView(routeItem: AppRoute.landing)
            case .onboarding:
                DummyView(routeItem: AppRoute.onboarding)
            case .dashboard:
                DummyView(routeItem: AppRoute.dashboard)
            }
        }
        .environmentObject(router)
    }
}
