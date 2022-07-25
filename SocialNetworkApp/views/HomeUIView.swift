//
//  HomeUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI
struct HomeUIView: View {
    @State var user: User
    @ObservedObject var loginManager: LoginViewModel
    @ObservedObject var postViewModel: PostViewModel

    var body: some View {
        TabView {
        
            PipelineUIView(postViemModel: postViewModel)
                .tabItem {
                    Label("accueil", systemImage: "house")
                }
            
            GroupListView(groupList: listGroupSample) // to replace with view specically
                .tabItem {
                    Label("groupe", systemImage: "rectangle.3.group.bubble.left")
                }
            
            ChatListUIView(searchText: "")
                .tabItem {
                    Label("discussion", systemImage: "person.2")
                }

            SettingsView(user: user, loginManager: loginManager)
                .tabItem {
                    Label("profil", systemImage: "person.circle")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView(user: user1, loginManager: LoginViewModel(), postViewModel: PostViewModel())
    }
}
