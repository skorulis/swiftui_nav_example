//
//  AppStore.swift
//  NavTest
//
//  Created by Alexander Skorulis on 4/2/21.
//

import Foundation
import SwiftRex
import CombineRex

struct AppState {
    var count: Int = 0
}

enum AppAction {
    case increment(Int)
}

typealias AppStore = ReduxStoreBase<AppAction, AppState>
func ignore<T>(_ t: T) -> Void { }

extension AppStore {
    
    static func make() -> ReduxStoreBase<AppAction, AppState> {
        
        let logger = LoggerMiddleware()
        
        return ReduxStoreBase<AppAction, AppState>(
            subject: .combine(initialValue: AppState()),
            reducer: appReducer(),
            middleware: logger
        )
    }
    
    static func appReducer() -> Reducer<AppAction, AppState> {
        let x = Reducer<AppAction, AppState>.reduce { (action, state) in
            switch action {
            case .increment(let amount):
                state.count += amount
            }
        }
        return x
    }
    
}

class LoggerMiddleware: Middleware {
    
    //private var getState: GetState<AppState>?
    
    func receiveContext(getState: @escaping GetState<AppState>, output: AnyActionHandler<AppAction>) {
        //self.getState = getState
    }
    
    func handle(action: AppAction, from dispatcher: ActionSource, afterReducer: inout AfterReducer) {
        switch action {
        case .increment(let amount):
            print("Increment \(amount)")
        }
    }
    
    
}
