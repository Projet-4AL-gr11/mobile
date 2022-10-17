//
//  GroupFollowerCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 26/09/2022.
//

import SwiftUI

struct GroupFollowerCard: View {
    
    var follower: GroupFollowers
    var body: some View {
        VStack{
            if follower.profilePicture != nil{
                let key = follower.profilePicture!.key
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
            Text(follower.username)
                .font(.subheadline)
        }
    }
}

struct GroupFollowerCard_Previews: PreviewProvider {
    static var previews: some View {
        GroupFollowerCard(
            follower: GroupFollowers(id: "rfejr", email: "dfefi", username: "ede", userType: "strinf", bio: "biographie", profilePicture: nil, followedGroups: nil)
        )
    }
}
