//
//  FriendShipCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/10/2022.
//

import SwiftUI

struct FriendShipCard: View {
    @State var user: User
    var userViewModel: UserViewModel
    @State var isFollowed: Bool = false
    @State var text: String = "Ajouter"
    var body: some View {
        HStack{
            if user.profilePicture != nil{
                let key = user.profilePicture!.key
                AsyncImage(url: URL(string: endPoint + key)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .background(Color("color_bg_inverted").opacity(0.05))
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            }
            else{
                Image("no-profile")
                    .resizable()
                    .background(Color("color_bg_inverted").opacity(0.05))
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading, spacing: 10){
                Text(user.username)
                    .font(.title)
                    .bold()
                Text(user.email)
                    .font(.caption)
            }
            .padding()
            Button{
                userViewModel.followUser(userId: user.id)
                isFollowed = !isFollowed
                text = isFollowed ? "✅" : "Ajouter"
            }label: {
                Text(text)
                    .bold()
                    .frame(width: 70, height: 40)
                    .cornerRadius(50)
            
            }
            .padding(.bottom, 50)
    
        }
        .shadow( radius: 10)
    }
    
    
}

struct FriendShipCard_Previews: PreviewProvider {
    static var previews: some View {
        FriendShipCard(user: user1, userViewModel: UserViewModel())
    }
}
