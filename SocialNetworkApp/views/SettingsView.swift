//
//  SettingsView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import SwiftUI

struct SettingsView: View {
    @State var user: User
    @ObservedObject var loginManager: LoginViewModel
    var body: some View {
        NavigationView {
            ZStack {
                Color("color_bg").edgesIgnoringSafeArea(.all)
                ScrollView {
                        VStack{
                            ScrollView{

                                SettingHeaderCard(user: user)
                     
                                SettingCard(icon: "person", title: "Compte")
                                    .onTapGesture {
                                        loginManager.getTimeline()
                                    }
                                SettingCard(icon: "bell", title: "Notifications et Son")
                                SettingCard(icon: "lock", title: "Securite")
                                SettingCard(icon: "archivebox", title: "Données et stockage")
                                SettingCard(icon: "paintbrush", title: "Apparence")
                                SettingCard(icon: "globe", title: "Langue", selectedValue: "English")
                                SettingCard(icon: "rectangle.portrait.and.arrow.right", title: "Se Deconnecter")
                                    .onTapGesture{
                                        loginManager.logout()
                                    }

                            }
                            .padding(.vertical)
              
                        }
                        .padding()
                }
                .navigationTitle("Reglage")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(user: user1, loginManager: LoginViewModel())
            .preferredColorScheme(.dark)
    }
}
