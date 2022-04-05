//
//  ProfileView.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import SwiftUI
import GoogleSignIn

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

      private let user = GIDSignIn.sharedInstance.currentUser

      var body: some View {
        NavigationView {
          VStack {
            VStack {
                NetworkImage(url: user?.profile?.imageURL(withDimension: 200), placeholder: Image(systemName: "person.circle.fill"))
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(8)
                Text(user?.profile?.name ?? "")
                  .font(.headline)
                Text(user?.profile?.email ?? "")
                  .font(.subheadline)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .cornerRadius(12)
            .padding()

            Button(action: viewModel.signOut) {
              Text("Sign out")
                .foregroundColor(.white)
                .padding()
                .background(Color.red).opacity(0.8)
                .cornerRadius(12)
                .padding()
            }
          }
        }
        .navigationViewStyle(StackNavigationViewStyle())
      }
    }

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
