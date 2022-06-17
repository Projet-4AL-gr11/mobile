//
//  SettingsView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack{
                    Color("color_bg").edgesIgnoringSafeArea(.all)
                    VStack{
                        ScrollView{

                            SettingHeaderCard()
                 
                            SettingCard(icon: "person", title: "Account")
                            SettingCard(icon: "bell", title: "Notifications and Sounds")
                            SettingCard(icon: "lock", title: "Privacy & Security")
                            SettingCard(icon: "archivebox", title: "Data and Storage")
                            SettingCard(icon: "paintbrush", title: "Appearence")
                            SettingCard(icon: "globe", title: "Language", selectedValue: "English")
                        }
                        .padding(.vertical)
          
                    }
                    .padding()
                }
            }
            .navigationTitle("Reglage")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
