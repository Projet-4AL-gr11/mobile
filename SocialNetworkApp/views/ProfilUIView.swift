//
//  ProfilUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct ProfilUIView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Text("Marine Lemaitre")
                        .font(.title)
                        .bold()
                    Text("lemmaitre@gmail.com")
                }
                .padding()
                Spacer()
                Image("profil")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(200)
            }.padding()
            VStack{
                HStack(alignment: .top){
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 35, height: 45)
                        .foregroundColor(.pink)
                        .padding()
                    VStack(alignment: .leading){
                        Text("username")
                        Text("M.lemaitre")
                            .font(.title2)
                            .bold()
                    }.padding()
                }.padding()
                HStack(alignment: .top){
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 35, height: 45)
                        .foregroundColor(.pink)
                        .padding()
                    VStack(alignment: .leading){
                        Text("nom")
                        Text("M.lemaitre")
                            .font(.title2)
                            .bold()
                    }.padding()
                }.padding()
                HStack(alignment: .top){
                    Image(systemName: "person.crop.square.filled.and.at.rectangle")
                        .resizable()
                        .frame(width: 35, height: 45)
                        .foregroundColor(.pink)
                        .padding()
                    VStack(alignment: .leading){
                        Text("email")
                        Text("M.lemaitre")
                            .font(.title2)
                            .bold()
                    }.padding()
                }.padding()
            }
        }
    }
}

struct ProfilUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilUIView()
    }
}
