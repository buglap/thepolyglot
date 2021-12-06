//
//  CustomColors.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import Foundation
import SwiftUI

extension Color {
    static let dynamicColor = Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .black : .white
        })
    static let customBlue = Color("blue")
    static let fucsia = Color("fucsia")
}
