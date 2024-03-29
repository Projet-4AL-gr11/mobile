//
//  UserCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 20/06/2022.
//

import SwiftUI

struct UserCard: View {
    
    var user: User
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
                    .foregroundColor(.black)
                    .font(.body)
                    .bold()
                Text(user.email)
                    .foregroundColor(.black)
                    .font(.caption)
            }
            .padding()
            }
        }
    }

struct UserCard_Previews: PreviewProvider {
    static var previews: some View {
        UserCard(user: user1)
    }
}

