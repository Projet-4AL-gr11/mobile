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

                                NavigationLink(destination: ProfilUIView(userViewModel: UserViewModel())){
                                    SettingCard(icon: "person", title: "Compte")
                                }
                                NavigationLink(destination: FriendListUIView(userViewModel: UserViewModel())){
                                    SettingCard(icon: "person.fill.checkmark", title: "Amis")
                                }
                                SettingCard(icon: "lock", title: "Securite")
                                NavigationLink(destination: EventUIView(eventViewModel: EventViewModel())){
                                    SettingCard(icon: "chevron.left.forwardslash.chevron.right", title: "Evenement")
                                }
                                SettingCard(icon: "paintbrush", title: "Apparence")
                                SettingCard(icon: "globe", title: "Langue", selectedValue: "Francais")
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
