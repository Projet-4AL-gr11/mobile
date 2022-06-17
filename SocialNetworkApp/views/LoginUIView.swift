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
    @State var isAuthenticated: Bool = false

    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: HomeUIView(), isActive: $isAuthenticated){
                    EmptyView()
                }.navigationTitle("Connexion")
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
                    .background(Color(red: 0.9, green: 0.89, blue: 0.89))
                SecureField("Mot de passe", text: $password)
                    .textContentType(.password)
                    .frame(height: 50)
                    .background(Color(red: 0.9, green: 0.89, blue: 0.89))
                HStack{
                    NavigationLink(destination: InscriptionUIView()){
                        Text("s'inscrire")
                    }
                    
                    Spacer()
                    Button(action: {}) {
                        Text("mot de passe oublié ?")
                            .foregroundColor(.gray)
                    }
                }
                Button(action: { self.isAuthenticated = !isAuthenticated} ) {
                    Text("Se connecter")
                }
                .padding()
            }.padding()
        }

    }
}

struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView()
    }
}
