//
//  postCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import SwiftUI

struct postCard: View {
    @StateObject var postManager = PostManager()
    let post: PostTimeLine
    @State var showCommentView = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10 ){
            HStack(alignment: .top){
                if post.creator.profilePicture != nil{
                    AsyncImage(url: URL(string: endPoint + post.creator.profilePicture!.key)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .scaledToFit()
                    .cornerRadius(50)
                }
                else{
                    Image("no-profile")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .cornerRadius(50)
                }
                
                VStack(alignment: .leading, spacing: 10){
                    Text("@" + post.creator.username)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                    NavigationLink(destination: CommentView(comments: postManager.comments)){
                        Text(post.text)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    if post.medias != nil && post.medias!.count > 0{
                        let key = post.medias![0].key
                        AsyncImage(url: URL(string: endPoint + key)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 300, height: 200)
                        .cornerRadius(10)
                        .padding()
                        
                    }
                    HStack(alignment: .center, spacing: 40){
                            Button{
                                self.showCommentView = true
                            }label: {
                                Image(systemName: "message")
                                Text(String(postManager.comments.count))
                            }.sheet(isPresented: $showCommentView){
                                AddCommentView(postId: post.id, comment: "")
                            }
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "arrowshape.turn.up.right")
                            Text("0")
                        }
                        Button{
                            self.likeToggle()

                        }label: {
                            postManager.isLiked ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                            Text(String(postManager.likes.count))

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
        }.onAppear(perform: fetch)
        .padding()
        .shadow(radius: 10)
    }
   private func fetch(){
        postManager.initializer(postId: post.id)
    }
    func likeToggle(){
        if postManager.isLiked == true {
            postManager.dislike(postId: post.id)
        }
        else{
            postManager.like(postId: post.id)
        }
        self.postManager.getLikes(postId: post.id)

    }
}

struct postCard_Previews: PreviewProvider {
    static var previews: some View {
        postCard(postManager: PostManager(), post: post1).preferredColorScheme(.dark)
    }
}
