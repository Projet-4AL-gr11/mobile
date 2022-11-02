//
//  FriendRequestlistView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/10/2022.
//

import SwiftUI

struct FriendRequestlistView: View {
    @StateObject var userViewModel: UserViewModel
    @State var searchText = ""
    var body: some View {
        ZStack {
            Color("color_bg").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 20){
                    if userViewModel.friendshipRequestList.count > 0 {
                        ForEach(userViewModel.friendshipRequestList, id: \.self) { friendRequest in
                            FriendShipRequestCard(user: friendRequest, userViewModel: userViewModel)
                        }
                    }
                    else{
                        Text("Vous n'avez pas de demande d'amis !")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Amis")
            .toolbar{
                NavigationLink{
                    SearchView(searchText: searchText)
                }label:{
                    Image(systemName: "magnifyingglass")
                }
            }
        }
    }
}

struct FriendRequestlistView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRequestlistView(userViewModel: UserViewModel())
    }
}
