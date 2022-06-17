//
//  SettingHeaderCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import SwiftUI

struct SettingHeaderCard: View {
    var body: some View {
        HStack{
            Image("Shezad")
                .resizable()
                .background( Color("color_bg_inverted").opacity(0.05))
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 6){
                HStack{
                    Text("Shezad Ahamed")
                        .fontWeight(.semibold)
                        .padding(.top, 3)
                    Spacer()
                }
                
                HStack{
                    Text("shezadahamed@example.com")
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
        SettingHeaderCard()
    }
}
