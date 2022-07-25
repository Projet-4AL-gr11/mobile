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
    
}
