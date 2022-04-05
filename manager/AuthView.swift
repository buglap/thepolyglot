//
//  AuthView.swift
//  manager
//
//  Created by Jenny escobar on 23/12/21.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        VStack {
            Spacer()
            LottieView(name: "main-animation")
            Text("Welcome to The Polyglot!")
                .fontWeight(.black)
                .foregroundColor(Color(.systemIndigo))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text("Empower your learning languages skills.")
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding()
            GoogleSignInButton()
                .padding()
                .onTapGesture {
                    viewModel.signIn()
                }.frame(height: 150)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
