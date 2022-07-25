//
//  SocialNetworkAppApp.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

@main
struct SocialNetworkAppApp: App {
    @State var user: User = user1
    @StateObject var loginManager = LoginViewModel()
    @StateObject var postViewModel = PostViewModel()

    var body: some Scene {
        WindowGroup {
            if loginManager.isLoggedIn {
                HomeUIView(user: user, loginManager: loginManager, postViewModel: PostViewModel())
                    .transition(.move(edge: .leading))
            }
            else{
                LoginUIView(loginManager: loginManager)
                    .transition(.move(edge: .leading))
            }
        }
    }
}
