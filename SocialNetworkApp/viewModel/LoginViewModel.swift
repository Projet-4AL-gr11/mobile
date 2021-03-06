
//
//  LoginViewModel.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 13/06/2022.
//

import Foundation
class LoginViewModel : ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var username: String = ""
    @Published var password: String = ""

    
    func login() {
        let defaults = UserDefaults.standard
        WebService.loginWithSession(pusername: username, ppassword: password){ result in
            switch result {
            case .success(let loginResponse):
                defaults.setValue(loginResponse.jwtToken, forKey: "jwtToken")
                print("here the offical token : \(loginResponse.jwtToken)")
                DispatchQueue.main.async {
                    self.isLoggedIn = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    func logout() {
        let defaults = UserDefaults.standard

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            defaults.removeObject(forKey: "jwtToken")
            self.isLoggedIn = false
        }
    }
    
    func getTimeline(){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        
        print("here you should get the token : \(token)")
        
        WebService.getTilmeLine(token: token) {result in
            
            switch result {
            case .success(let posts):
                print("getting data")
                print(posts.self)
            case .failure(let error):
                print("error can't retrieve data")
                print("another print for token: \(token)")
                print(error.localizedDescription)
            }
        }
    }
    
}
