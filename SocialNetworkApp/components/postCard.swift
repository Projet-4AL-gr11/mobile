//
//  postCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import SwiftUI

struct postCard: View {
    let post: PostTimeLine
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
                    Text(post.text)
                        .font(.headline)
                    Image("postImage")
                        .resizable()
                        .frame(width:300, height: 200)
                        .scaledToFit()
                        .cornerRadius(20)
                    HStack(alignment: .center, spacing: 40){
                        Button{
                            
                        }label: {
                            Image(systemName: "message")
                            Text(String("3"))
                            
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "arrowshape.turn.up.right")
                            Text("4")
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "heart")
                            Text(String("4"))

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
        postCard(post: post1).preferredColorScheme(.dark)
    }
}
