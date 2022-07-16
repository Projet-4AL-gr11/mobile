//
//  InscriptionUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct InscriptionUIView: View {
    @ObservedObject var loginManager: LoginViewModel
    var body: some View {
        NavigationView {
            ZStack {
                Color("color_bg").edgesIgnoringSafeArea(.all)
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
                    TextField("Email", text: .constant(""))
                        .frame(height: 50)
                    TextField("Mot de passe", text: .constant(""))
                        .frame(height: 50)
                    TextField("Confirmer mot de passe", text: .constant(""))
                        .frame(height: 50)
                    HStack{
                        Spacer()
                        NavigationLink(destination: LoginUIView(loginManager: loginManager)){
                            Text("Se connecter")
                                .foregroundColor(.gray)
                        }
                    }
                    Button("S'inscrire") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .padding()
                    
                    
                }.padding()
            }
            .navigationTitle(Text("Inscription"))
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct InscriptionUIView_Previews: PreviewProvider {
    static var previews: some View {
        InscriptionUIView(loginManager: LoginViewModel())
            .preferredColorScheme(.dark)
    }
}
