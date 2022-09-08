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
            if group.picture != nil{
                AsyncImage(url: URL(string: endPoint + group.picture!.key)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 30, height: 30)
                .padding()
                .cornerRadius(50)
            }
            else{
                Image(systemName: "rectangle.3.group.bubble.left")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(50)
            }
            Text(group.name)
                .font(.title2)
            Spacer()
            Image(systemName: "arrow.forward")
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
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
