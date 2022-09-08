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
            ZStack {
                if userViewModel.user?.bannerPicture != nil{
                    let banKey = userViewModel.user?.bannerPicture!.key
                    AsyncImage(url: URL(string: endPoint + banKey!)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .ignoresSafeArea(.all)
                    .blur(radius: 0.9, opaque: false)
                }
                else{
                    Image("no-background")
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .ignoresSafeArea(.all)
                        .blur(radius: 0.9, opaque: false)
                }
                VStack {
                    HStack{
                        VStack(alignment: .leading){
                            Text(userViewModel.user!.username)
                                .font(.title)
                                .bold()
                            Text(userViewModel.user!.email)
                        }
                        .foregroundColor(.white)
                        .padding()
                        Spacer()
                        if userViewModel.user?.profilePicture != nil{
                            let key = userViewModel.user?.profilePicture!.key
                            AsyncImage(url: URL(string: endPoint + key!)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                        }
                        else{
                            Image("no-profile")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(200)
                        }
                        
                    }.padding()
                    Text(userViewModel.user!.bio)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
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
