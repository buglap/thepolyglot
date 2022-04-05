//
//  ArticleCardView.swift
//  manager
//
//  Created by Jenny escobar on 3/04/22.
//

import SwiftUI

struct ArticleCardView: View {
    var urlToImage: String
    var title: String
    var description: String
    @State var isAdded: Bool
    var url: String
    var didTapSaveArticle: (() -> Void)?
    @State private var showWebView = false

    var body: some View {
        VStack {
            HStack {
                NetworkImage(url: URL(string: urlToImage), placeholder: Image(systemName: "photo.circle")).frame(width: 100)
                Text(title).foregroundColor(.white)
                Spacer()
            }.padding(.bottom, 6).onTapGesture {
                showWebView.toggle()
            }.sheet(isPresented: $showWebView) {
                WebView(url: URL(string: url)!)
            }
            Text(description).foregroundColor(.gray).padding(.bottom, 6)
            if !isAdded {
                Button(action: {
                    isAdded = true
                    didTapSaveArticle?()
                }) {
                    Image(systemName: "plus.circle")
                }
            }
        }.padding().background(Color.black).cornerRadius(20).padding()
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView(urlToImage: "https://cdn.prod.www.spiegel.de/images/d21bcc7e-f500-4c88-9e6a-7c773cd9ae58_w1280_r1.77_fpx69.43_fpy54.98.jpg", title:  "Kryptowährungen in Russland: Wird der Bitcoin vom »Friedensgeld« zur Kriegswährung?", description: "Der Ukrainekrieg sorgt für einen Ansturm auf Bitcoin, Ether und Co., die Branche erlaubt russischen Kunden weiter den Handel damit. Finanzpolitiker sind alarmiert.", isAdded: true, url: "https://www.spiegel.de/wirtschaft/kryptowaehrungen-in-russland-wird-der-bitcoin-vom-friedensgeld-zur-kriegswaehrung-a-a13d6589-2d3e-4056-9b9e-4df44324bd07")
    }
}
