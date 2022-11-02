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
    @ObservedObject var groupViewModel: GroupModelView

    var body: some View {
        TabView {
        
            PipelineUIView(postViemModel: postViewModel)
                .onAppear {
                    postViewModel.getTimeline()
                }
                .tabItem {
                    Label("accueil", systemImage: "house")
                }
                
            
            GroupListView(groupList: listGroupSample) // to replace with view specically
                .onAppear{
                    groupViewModel.getGroup()
                }
                .tabItem {
                    Label("groupe", systemImage: "rectangle.3.group.bubble.left")
                }

            SettingsView(user: user, loginManager: loginManager)
                .tabItem {
                    Label("profil", systemImage: "person.circle")
                }
            
            AddFriendView()
                .tabItem {
                    Label("recherche", systemImage: "magnifyingglass")
                }
            
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView(user: user1, loginManager: LoginViewModel(), postViewModel: PostViewModel(), groupViewModel: GroupModelView())
    }
}
