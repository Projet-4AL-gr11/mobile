//
//  GroupCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 21/06/2022.
//

import SwiftUI

struct GroupCard: View {
    @State var group: Group
    var body: some View {
        HStack{
            Image(systemName: "person.3.sequence.fill")
                .resizable()
                .frame(width: 35, height: 35)
                .padding()
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(50)
            Text(group.name)
                .font(.title2)
            Spacer()
            Image(systemName: "arrow.forward")
                .frame(width: 50, height: 50)
                .foregroundColor(.orange)
        }
        .padding()
        .shadow(radius: 20)
    }
}

struct GroupCard_Previews: PreviewProvider {
    static var previews: some View {
        GroupCard(group: group1)
    }
}
