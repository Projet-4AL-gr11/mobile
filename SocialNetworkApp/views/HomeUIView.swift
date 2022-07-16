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
    var body: some View {
        TabView {
        
            PipelineUIView()
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
                    Label("reglage", systemImage: "person.circle")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView(user: user1, loginManager: LoginViewModel())
    }
}
