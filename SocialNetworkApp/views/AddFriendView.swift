//
//  addFriendView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 21/10/2022.
//

import SwiftUI

struct AddFriendView: View {
    @StateObject var userViewModel = UserViewModel()
    @State var text: String = ""
    @Environment(\.dismiss) var dismiss
       
    var body: some View {
        VStack(alignment: .trailing, spacing: 15){
            TextField("Nom du groupe", text: $text)
                .frame(width: .infinity, height: 50, alignment: .center)
                .border(.gray)
                .cornerRadius(20)
            Button{
                if text.count > 0{
                    userViewModel.getUserByName(name: text)
                }
            } label: {
                Text("Chercher")
            }
            
            Divider()
            if userViewModel.searchedUser != nil {
                FriendShipCard(user: (userViewModel.searchedUser?.last)!, userViewModel: userViewModel)
            }
            
            Spacer()
            
            
        }.padding()
        .navigationTitle("Ajouter un membre")
    }
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView()
    }
}
