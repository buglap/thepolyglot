//
//  NetworkImage.swift
//  manager
//
//  Created by Jenny escobar on 3/04/22.
//

import SwiftUI

struct NetworkImage: View {
    let url: URL?
    var placeholder: Image

    var body: some View {
        if let url = url,
           let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            placeholder
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(url: nil, placeholder: Image(systemName: "person.circle.fill"))
    }
}
