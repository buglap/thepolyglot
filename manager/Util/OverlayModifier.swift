//
//  OverlayModifier.swift
//  ThePolyglot
//
//  Created by Jenny escobar on 5/04/22.
//

import SwiftUI

struct OverlayModifier<Overlay: View>: ViewModifier {

    @Binding var isPresented: Bool
    let overlay: Overlay

    init(isPresented: Binding<Bool>, @ViewBuilder overlay: @escaping () -> Overlay) {
        self._isPresented = isPresented
        self.overlay = overlay()
    }

    func body(content: Content) -> some View {
        content.overlay(isPresented ? overlay : nil)
    }
}

extension View {
    func popup<Overlay: View>(isPresented: Binding<Bool>, @ViewBuilder overlay: @escaping () -> Overlay) -> some View {
        return modifier(OverlayModifier(isPresented: isPresented, overlay: overlay))
    }
}
