//
//  CommentCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 24/07/2022.
//

import SwiftUI

struct CommentCard: View {
    let comment: Comment
    var body: some View {
        VStack(alignment: .leading, spacing: 10 ){
            HStack(alignment: .top){
                Image("profil")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                    .cornerRadius(50)
                VStack(alignment: .leading, spacing: 10){
                    let username = (comment.creator != nil) ? comment.creator?.username : "Inconnu"
                    Text("@" + username!)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                    NavigationLink(destination: EmptyView()){
                        Text(comment.text)
                            .font(.body)
                            .foregroundColor(.gray)
                            .frame(alignment: .trailing)
                    }
                }
            }
        }
        .padding()
        .shadow(radius: 10)
    Divider()
    }
}

struct CommentCard_Previews: PreviewProvider {
    static var previews: some View {
        CommentCard(comment: comment1)
    }
}
