//
//  FriendShipRequestCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/10/2022.
//

import SwiftUI

struct FriendShipRequestCard: View {
    @State var user: FriendShipList
    var userViewModel: UserViewModel
    @State var isFollowed: Bool = false
    @State var text: String = "accepter"
    @State var text2: String = "rejetter"

    var body: some View {
        HStack{
            if user.sender.profilePicture != nil{
                let key = user.sender.profilePicture!.key
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
                Text(user.sender.username)
                    .font(.title)
                    .bold()
                Text(user.sender.email)
                    .font(.caption)
            }
            .padding()
            VStack {
                Button{
                    userViewModel.acceptFreindShipRequest(userId: user.sender.id)
                    isFollowed = !isFollowed
                    text = isFollowed ? "✅" : "accepter"
                }label: {
                    Text(text)
                        .bold()
                        .frame(width: 70, height: 40)
                        .cornerRadius(50)
                
                }
                .padding(.top, 50)
                Button{
                    userViewModel.rejectFriendshipRequest(userId: user.sender.id)
                    text2 = "rejetter"
                }label: {
                    Text(text2)
                        .bold()
                        .frame(width: 70, height: 40)
                        .cornerRadius(50)
                        .foregroundColor(.red)
                
                }
                .padding(.bottom, 50)
            }
            
           
    
        }
        .shadow( radius: 10)
    }
    
}

struct FriendShipRequestCard_Previews: PreviewProvider {
    static var previews: some View {
        FriendShipRequestCard(user: FriendShipList(createdAt: "zdz", sender: user1), userViewModel: UserViewModel())
    }
}
