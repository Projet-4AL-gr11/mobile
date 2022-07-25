//
//  userViewModel.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/07/2022.
//

import Foundation
class UserViewModel: ObservableObject{
    @Published var friends: [User] = []
    
    func getFriends(userId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        
        print("here you should get the token : \(token)")
        
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
    
}
