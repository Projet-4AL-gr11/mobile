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
    @Published var friendshipRequestList: [FriendShipList] = []
    
    init(){
        let defaults = UserDefaults.standard
        guard let userId = defaults.string(forKey: "userId") else{
            return
        }
        getFriends(userId: userId)
        getUserById(userId: userId)
        getfriendShipRequest()
        
    }
    
    func changeBanner(bannerImage: Data){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.ChangeBanner(token: token, imageData: bannerImage) { result in
            switch result {
            case .success(_):
               print("banner changed")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func changeProfil(profilImage: Data){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.changeProfil(token: token, imageData: profilImage) { result in
            switch result {
            case .success(_):
               print("profil changed")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
    
    func followUser(userId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.friendShipRequest(token: token, userId: userId) { result in
            switch result {
                case .success(_):
                    print("friendship request sent for userId: \(userId)")
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func acceptFreindShipRequest(userId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.acceptFriendship(token: token, userId: userId) { result in
            switch result {
                case .success(_):
                    print("friendship request accepted sent for userId: \(userId)")
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func getfriendShipRequest(){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.listfriendShipRequest(token: token) { result in
            switch result {
                case .success(let requests): // definir la valeur de retour inchallah ce soir
                DispatchQueue.main.async {
                    self.friendshipRequestList = requests
                }
                    print("friendship request listed")
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func cancelFriendshipRequest(userId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.cancelFriendshipRequest(token: token, userId: userId) { result in
            switch result {
                case .success(_):
                    print("friendship  canceled for userId: \(userId)")
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func rejectFriendshipRequest(userId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.rejectFriendshipRequest(token: token, userId: userId) { result in
            switch result {
                case .success(_):
                    print("friendship request canceled for userId: \(userId)")
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
}
