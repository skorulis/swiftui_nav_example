//
//  OnboardingRouter.swift
//  NavTest
//
//  Created by Alexander Skorulis on 29/1/21.
//

import SwiftUI

enum OnboardingRoute: String, RouteItem {
    
    case page1, page2, page3, page4
    
    var title: String {
        return self.rawValue
    }
    
    var next: RouteItem? {
        switch self {
        case .page1: return OnboardingRoute.page2
        case .page2: return OnboardingRoute.page3
        case .page3: return OnboardingRoute.page4
        case .page4: return nil
        }
    }
    
    
}


class OnboardingRouter: ObservableObject, PRouter {
    
    @Published var stack: [OnboardingRoute] = [.page1]
    
    var currentPage: OnboardingRoute {
        return stack.last!
    }
    
    func trigger(route: RouteItem) {
        stack.append(route as! OnboardingRoute)
    }
    
    func pop() {
        if stack.count > 1 {
            stack.removeLast()
        }
    }
    
    
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.opacity
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


struct OnboardingRouterView: View {
    
    @ObservedObject var router: OnboardingRouter
    @EnvironmentObject var appRouter: AppRouter
    
    init(router: OnboardingRouter) {
        self.router = router
    }
    
    var body: some View {
        NavigationView {
            OnboardingView(route: router.currentPage)
                .animation(.easeInOut)
                .transition(.scale)
                .navigationTitle(router.currentPage.title)
                .navigationBarItems(leading: Button(action: {
                    if router.stack.count == 1 {
                        appRouter.current = .landing
                    } else {
                        router.pop()
                    }
                    
                }, label: {
                    Text("Back")
                }))
            
            
        }
        .environmentObject(router)
        .transition(.slide)
        
        
    }
    
}



struct OnboardingRouterView_Previews: PreviewProvider {
    
    static var previews: some View {
        let appRouter = AppRouter()
        OnboardingRouterView(router: OnboardingRouter())
            .environmentObject(appRouter)
    }
}
