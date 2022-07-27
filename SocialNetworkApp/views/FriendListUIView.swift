//
//  FriendListUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct FriendListUIView: View {
    @StateObject var userViewModel: UserViewModel
    @State var searchText = ""
    var body: some View {
        ZStack {
            Color("color_bg").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 20){
                    if userViewModel.friends.count > 0 {
                        ForEach(userViewModel.friends, id: \.self) { friend in
                            UserCard(user: friend)
                                                
                        }
                    }
                    else{
                        Text("Vous n'avez pas encore d'amis !")
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

struct FriendListUIView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListUIView(userViewModel: UserViewModel())
    }
}
