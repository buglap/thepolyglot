//
//  Calendar.swift
//  manager
//
//  Created by Jenny escobar on 3/12/21.
//

import SwiftUI

struct Calendar: View {
    
    @State private var appointmentDate = Date()
    var body: some View {
        DatePicker(
            "Start Date",
            selection: $appointmentDate,
            displayedComponents: [.date]
        )
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}
