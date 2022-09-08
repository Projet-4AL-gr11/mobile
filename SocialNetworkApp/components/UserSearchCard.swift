//
//  UserSearchCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 21/06/2022.
//

import SwiftUI

struct UserSearchCard: View {
    @State var user: User
    var group: Group
    var groupviewModel: GroupModelView
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
                groupviewModel.addMember(groupId: group.id, user: user)
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

struct UserSearchCard_Previews: PreviewProvider {
    static var previews: some View {
        UserSearchCard(user: user1, group: group1, groupviewModel: GroupModelView())
    }
}
 
