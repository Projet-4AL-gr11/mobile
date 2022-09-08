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
                if comment.creator.profilePicture != nil {
                    let key = comment.creator.profilePicture?.key
                    AsyncImage(url: URL(string: endPoint + key!)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                    .cornerRadius(50)
                }
                else{
                    Image("profil")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .scaledToFit()
                        .cornerRadius(50)
                }
                VStack(alignment: .leading, spacing: 10){
                    Text("@" + comment.creator.username)
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
