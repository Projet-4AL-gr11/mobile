//
//  LoginUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct LoginUIView: View {
    @State var email = ""
    @State var password = ""
    @ObservedObject var loginManager: LoginManager

    
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
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(height: 50)
                    SecureField("Mot de passe", text: $password)
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
                    Button(action: { loginManager.login()} ) {
                        Text("Se connecter")
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle("Connexion")
        }

    }
}

struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView(loginManager: LoginManager())
            .preferredColorScheme(.dark)
    }
}
