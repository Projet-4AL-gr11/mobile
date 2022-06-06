//
//  InscriptionUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct InscriptionUIView: View {
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
            Text("Inscription")
                .font(.title)
                .bold()
                .padding()
            Text("Rejoindre notre plateforme de coding")
                .padding()
            TextField("Nom", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .frame(height: 50)
                .background(Color(red: 0.9, green: 0.89, blue: 0.89))

            TextField("Email", text: .constant(""))
                .frame(height: 50)
                .background(Color(red: 0.9, green: 0.89, blue: 0.89))
            TextField("Mot de passe", text: .constant(""))
                .frame(height: 50)
                .background(Color(red: 0.9, green: 0.89, blue: 0.89))
            TextField("Confirmer mot de passe", text: .constant(""))
                .frame(height: 50)
                .background(Color(red: 0.9, green: 0.89, blue: 0.89))
            HStack{
                Spacer()
                Text("Se connecter")
                    .foregroundColor(.gray)
            }
            Button("S'inscrire") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding()
        }.padding()
    }
}

struct InscriptionUIView_Previews: PreviewProvider {
    static var previews: some View {
        InscriptionUIView()
    }
}
