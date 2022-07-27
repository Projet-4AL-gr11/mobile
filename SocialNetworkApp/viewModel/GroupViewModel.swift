//
//  GroupViewModel.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 13/06/2022.
//

import Foundation
class GroupModelView: ObservableObject{
    @Published var groupList: [Group] = []
    @Published var groupMembers: [GroupMembers] = []
    @Published var searchedUser: User? = nil
    
    init() {
        getGroup()
    }
    
    func getGroup(){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        
        print("here you should get the token : \(token)")
        
        WebService.getGroup(token: token) {result in
            
            switch result {
            case .success(let groups):
                DispatchQueue.main.async {
                    self.groupList = groups
                }
            case .failure(let error):
                print("can't retrieves groups")
                print(error.localizedDescription)
            }
        }
    }
    
    func getGroupMembers(groupId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        
        print("here you should get the token : \(token)")
        
        WebService.getGroupMembers(token: token, groupId: groupId) {result in
            
            switch result {
            case .success(let members):
                DispatchQueue.main.async {
                    self.groupMembers = members
                }
            case .failure(let error):
                print("can't retrieves groups")
                print(error.localizedDescription)
            }
        }
    }
    
    func createGroup(name: String) -> Bool{
        let defaults = UserDefaults.standard
        var isDone = true

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return false
        }
            
        WebService.createGroup(token: token, name: name) {result in
            
            switch result {
            case .success(_):
                self.getGroup()
            case .failure(let error):
                isDone = false
                print("can't retrieves groups")
                print(error.localizedDescription)
            }
        }
        return isDone
    }
    
    
    func removeMember(name: String) -> Bool{
        let defaults = UserDefaults.standard
        var isDone = true

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return false
        }
            
        WebService.createGroup(token: token, name: name) {result in
            
            switch result {
            case .success(_):
                self.getGroup()
            case .failure(let error):
                isDone = false
                print("can't retrieves groups")
                print(error.localizedDescription)
            }
        }
        return isDone
    }
    
    func getUser(name: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        
        print("here you should get the token : \(token)")
        
        WebService.getUserByName(token: token, name: name) {result in
            
            switch result {
            case .success(let user):
            let findedUser = user[0]
            DispatchQueue.main.async {
                self.searchedUser = findedUser
            }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addMember(groupId: String, user: User){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        
        print("here you should get the token : \(token)")
        
        WebService.joinGroup(token: token, groupId: groupId, user: user) {result in
            
            switch result {
            case .success(_):
                print("user added")
            case .failure(let error):
                print("error on joining group")
                print(error.localizedDescription)
            }
        }
    }
    
}
