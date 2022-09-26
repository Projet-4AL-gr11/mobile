//
//  userViewModel.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/07/2022.
//

import Foundation
class UserViewModel: ObservableObject{
    @Published var friends: [User] = []
    @Published var user: User? = nil
    @Published var searchedUser: [User]? = nil
    
    init(){
        let defaults = UserDefaults.standard
        guard let userId = defaults.string(forKey: "userId") else{
            return
        }
        getFriends(userId: userId)
        getUserById(userId: userId)
        
    }
    
    func getFriends(userId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.getFriends(token: token, userId: userId) {result in
            
            switch result {
            case .success(let friends):
                DispatchQueue.main.async {
                    self.friends = friends
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getUserById(userId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.getUserById(token: token, userId: userId) {result in
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.user = user
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getUserByName(name: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.getUserByName(token: token, name: name) {result in
            
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.searchedUser = users
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
