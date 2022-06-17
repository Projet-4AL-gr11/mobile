//
//  ContentView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        TabView {
        
            PipelineUIView() //
                .tabItem {
                    Label("accueil", systemImage: "house")
                }
            
            Text("suivi") // to replace with view specically
                .tabItem {
                    Label("suivi", systemImage: "list.bullet")
                }
            
            ChatUIView(searchText: "")
                .tabItem {
                    Label("discussion", systemImage: "person.2")
                }

            SettingsView()
                .tabItem {
                    Label("reglage", systemImage: "person.circle")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
