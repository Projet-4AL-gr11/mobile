//
//  ProfilUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct ProfilUIView: View {
    let userViewModel: UserViewModel
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Text(userViewModel.user!.username)
                        .font(.title)
                        .bold()
                    Text(userViewModel.user!.email)
                }
                .padding()
                Spacer()
                Image("profil")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(200)
            }.padding()
            Text(userViewModel.user!.bio)
                .padding()
                .font(.headline)
            ScrollView{
                AccountDetailCard(icon: "person", title: userViewModel.user!.username, selectedValue: "")
                AccountDetailCard(icon: "mail", title: userViewModel.user!.email, selectedValue: "")
                AccountDetailCard(icon: "person.badge.key.fill", title: userViewModel.user!.userType, selectedValue: "")

            }
        }
    }
}

struct ProfilUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilUIView(userViewModel: UserViewModel())
    }
}
