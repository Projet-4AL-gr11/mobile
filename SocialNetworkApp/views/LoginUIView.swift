//
//  LoginUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct LoginUIView: View {
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFit()
            Text("Login")
                .font(.title)
                .bold()
                .padding()
            Text("challenger avec du code ")
            TextField("Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .frame(height: 50)
                .background(Color(red: 0.9, green: 0.89, blue: 0.89))
            TextField("Mot de passe", text: .constant(""))
                .frame(height: 50)
                .background(Color(red: 0.9, green: 0.89, blue: 0.89))
            HStack{
                Text("s'inscrire")
                    .foregroundColor(.gray)
                Spacer()
                Text("mot de passe oublié ?")
                    .foregroundColor(.gray)
            }
            Button("Se connecter") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding()
        }.padding()
    }
}

struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView()
    }
}
