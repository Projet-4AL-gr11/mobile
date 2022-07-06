//
//  UserCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 20/06/2022.
//

import SwiftUI

struct UserCard: View {
    
    @State var user: User
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack{
                Image("Catherine")
                    .resizable()
                    .background( Color("color_bg").opacity(0.1))
                    .frame(width: 80, height: 80)
                    .overlay(Circle().stroke(Color("color_primary"), lineWidth: 5))
                    .clipShape(Circle())
                Text("\(user.username)")
                    .bold()
                    .padding(.top, 3)
            }
            Button{
                
            }label: {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(50)
            }
        }
    }
}

struct UserCard_Previews: PreviewProvider {
    static var previews: some View {
        UserCard(user: user1)
    }
}
