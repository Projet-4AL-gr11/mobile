//
//  LoginManager.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 22/06/2022.
//

import Foundation

class LoginManager : ObservableObject {
    @Published var isLoggedIn = false
    
    func login() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isLoggedIn = true
        }
    }
    func logout() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isLoggedIn = false
        }
    }
}
