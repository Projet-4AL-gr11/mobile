//
//  postCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import SwiftUI

struct postCard: View {
    let post: PostDto
    var body: some View {
        VStack(alignment: .leading, spacing: 10 ){
            HStack(alignment: .top){
                Image("profil")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                    .cornerRadius(50)
                VStack(alignment: .leading){
                    Text("@" + post.creator.username)
                        .font(.title2)
                        .bold()
                    Text(post.sharedPost.text)
                        .font(.headline)
                    Image("postImage")
                        .resizable()
                        .frame(width: .infinity, height: .infinity)
                        .scaledToFit()
                        .cornerRadius(20)
                    HStack(alignment: .center, spacing: 40){
                        Button{
                            
                        }label: {
                            Image(systemName: "message")
                            Text(String(post.sharedPost.comments.count))
                            
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "arrowshape.turn.up.right")
                            Text("4")
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "heart")
                            Text(String(post.sharedPost.likes.count))

                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                    .padding(.top, 3)
                }
            }
            Divider()
        }
        .padding()
        .shadow(radius: 10)
    }
}

struct postCard_Previews: PreviewProvider {
    static var previews: some View {
        postCard(post: postDtoSample)
    }
}
