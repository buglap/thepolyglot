//
//  PickerView.swift
//  manager
//
//  Created by Jenny escobar on 13/12/21.
//

import SwiftUI

struct PickerView: View {
    @Binding var mapChoioceString: String
    @State private var mapChoioceType: Int = 1
    var settings: [String]
    var body: some View {
        let binding = Binding<Int>(
            get: { self.mapChoioceType },
                    set: {
                        self.mapChoioceType = $0
                        self.mapChoioceString = self.settings[self.mapChoioceType]
                    })
        Picker("Options", selection: binding) {
            ForEach(0 ..< settings.count) { index in
                Text(self.settings[index])
                    .tag(index)
            }
        }.accentColor(Color.pink)
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(mapChoioceString: .constant("Map"), settings:["Map", "Transit", "Satellite"])
    }
}
