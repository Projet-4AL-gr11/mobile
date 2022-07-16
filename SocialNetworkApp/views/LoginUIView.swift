//
//  LoginUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct LoginUIView: View {
    @StateObject var loginManager: LoginViewModel

    
    var body: some View {
        NavigationView {
            ZStack {
                Color("color_bg").edgesIgnoringSafeArea(.all)
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
                    TextField("Nom d'utilisateur", text: $loginManager.username)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(height: 50)
                    SecureField("Mot de passe", text: $loginManager.password)
                        .textContentType(.password)
                        .frame(height: 50)
                    HStack{
                        NavigationLink(destination: InscriptionUIView(loginManager: loginManager)){
                            Text("s'inscrire")
                        }
                        
                        Spacer()
                        Button(action: {}) {
                            Text("mot de passe oublié ?")
                                .foregroundColor(.gray)
                        }
                    }
                    Button(action: {
                        loginManager.login()
                        
                    } ) {
                        Text("Se connecter")
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle("Connexion")
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView(loginManager: LoginViewModel())
            .preferredColorScheme(.dark)
    }
}
