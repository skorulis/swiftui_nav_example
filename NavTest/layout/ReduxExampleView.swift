//
//  ReduxExample.swift
//  NavTest
//
//  Created by Alexander Skorulis on 4/2/21.
//

import Foundation
import SwiftUI
import SwiftRex
import CombineRex

class ReduxExampleViewModel: ObservableObject {
    
    let store: AppStore
    @Published var proj: ObservableViewModel<AppAction, AppState>
    
    var count: Int {
        return proj.state.count
    }
    
    init(store: AppStore) {
        self.store = store
        self.proj = ReduxExampleViewModel.projection(store: store)
    }
    
    static func projection<S: StoreType>(store: S) -> ObservableViewModel<AppAction, AppState> where S.ActionType == AppAction, S.StateType == AppState {
        return store.projection(action: {$0}, state: {$0})
            .asObservableViewModel(initialState: AppState(), emitsValue: .always)
    }
    
}

struct ReduxExampleView: View {
    
    @ObservedObject var viewModel: ReduxExampleViewModel
    @ObservedObject var projectionWatch: ObservableViewModel<AppAction, AppState>
    
    init() {
        let store = AppStore.make()
        let viewModel = ReduxExampleViewModel(store: store)
        self.viewModel = viewModel
        self.projectionWatch = viewModel.proj
    }
    
    var body: some View {
        VStack {
            Text("COUNT: \(viewModel.count)")
            //Text("Value: \(p1.state.count)")
            Button(action: {
                viewModel.store.dispatch(.increment(4))
            }, label: {
                Text("Add")
            })
        }
        
    }
    
}
