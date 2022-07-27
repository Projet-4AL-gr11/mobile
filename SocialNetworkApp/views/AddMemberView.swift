//
//  AddMemberView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/07/2022.
//

import SwiftUI

struct AddMemberView: View {
    @StateObject var groupViewModel = GroupModelView()
    @State var text: String = ""
    var group: Group
    @Environment(\.dismiss) var dismiss
       
    var body: some View {
        VStack(alignment: .trailing, spacing: 15){
            TextField("Nom du groupe", text: $text)
                .frame(width: .infinity, height: 50, alignment: .center)
                .border(.gray)
                .cornerRadius(20)
            Button{
                if text.count > 0{
                    groupViewModel.getUser(name: text)
                }
            } label: {
                Text("Chercher")
            }
            
            Divider()
            if groupViewModel.searchedUser != nil {
                UserSearchCard(user: groupViewModel.searchedUser!, group: group, groupviewModel: groupViewModel)
            }
            
            Spacer()
            
            
        }.padding()
        .navigationTitle("Ajouter un membre")
    }
}

struct AddMemberView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemberView(group: group1)
    }
}


