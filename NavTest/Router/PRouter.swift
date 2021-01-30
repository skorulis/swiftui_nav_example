//
//  PRouter.swift
//  NavTest
//
//  Created by Alexander Skorulis on 29/1/21.
//

import SwiftUI

protocol RouteItem {
    
    var title: String { get }
    var next: RouteItem? { get }
}

protocol PRouter: ObservableObject {
    func trigger(route: RouteItem)
    
}
