//
//  AccountDetailCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/07/2022.
//

import SwiftUI

struct AccountDetailCard: View {
    var icon: String = ""
    var title: String = ""
    var selectedValue: String?
    var body: some View {
        HStack{
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(Color("color_primary"))
            
            VStack(alignment: .leading, spacing: 6){
                HStack{
                    Text(title)
                        .fontWeight(.semibold)
                        .padding(.top, 3)
                        .foregroundColor(.black)
                    Spacer()
                    
                     selectedValue != nil ?
                        Text(selectedValue ?? "")
                        .foregroundColor(Color("color_bg_inverted").opacity(0.5))
                        .padding(.top, 3): nil
                }
                
                Divider()
                    .padding(.top, 8)
            }
            .padding(.horizontal, 10)
        }
        .padding(.vertical, 10)
    }
}

struct AccountDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailCard()
    }
}
