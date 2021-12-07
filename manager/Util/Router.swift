//
//  Router.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import Foundation
import SwiftUI

protocol Routing {
    associatedtype Route
    associatedtype View: SwiftUI.View
    
    @ViewBuilder func view(for route: Route) -> Self.View
}
