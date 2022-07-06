//
//  UserSearchCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 21/06/2022.
//

import SwiftUI

struct UserSearchCard: View {
    @State var user: User
    @State var isFollowed: Bool = false
    @State var text: String = "Suivre"
    var body: some View {
        HStack{
            Image("Catherine")
                .resizable()
                .frame(width: 100, height: 100)
                .background(.orange)
                .cornerRadius(50)
            VStack(alignment: .leading, spacing: 10){
                Text(user.username)
                    .font(.title)
                    .bold()
                Text(user.email)
                    .font(.caption)
            }
            .padding()
            Button{
                isFollowed = !isFollowed
                text = isFollowed ? "Abonné" : "Suivre"
            }label: {
                Text(text)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 70, height: 40)
                    .cornerRadius(50)
            
            }
            .background(.orange)
            .padding(.bottom, 50)
    
        }
        .shadow( radius: 10)
    }
}

struct UserSearchCard_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchCard(user: user1)
    }
}
