//
//  SettingHeaderCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import SwiftUI

struct SettingHeaderCard: View {
    @State var user: User
    var body: some View {
        HStack{
            if user.profilePicture != nil {
                AsyncImage(url: URL(string: endPoint + user.profilePicture!.key)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
            }
            else{
                Image("no-profile")
                    .resizable()
                    .background( Color("color_bg_inverted").opacity(0.05))
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 6){
                HStack{
                    Text(user.username)
                        .fontWeight(.semibold)
                        .padding(.top, 3)
                    Spacer()
                }
                
                HStack{
                    Text(user.email)
                        .foregroundColor(Color("color_bg_inverted").opacity(0.5))
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                }
                
                Divider()
                    .padding(.top, 8)
            }
            .padding(.horizontal, 10)
        }
        .padding(.vertical, 20)
    }
}

struct SettingHeaderCard_Previews: PreviewProvider {
    static var previews: some View {
        SettingHeaderCard(user: user1)
    }
}
