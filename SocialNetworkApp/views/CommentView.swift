//
//  CommentView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 24/07/2022.
//

import SwiftUI

struct CommentView: View {
    var comments: [Comment]

    var body: some View {
            ZStack {
                Color("color_bg").edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading){
                        if comments.count > 0 {
                            ForEach(comments, id: \.self) { comment in
                                CommentCard(comment: comment)
                               
                            }
                        }
                        else{
                            Text("pas de commentaires")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .navigationTitle("Commentaires")
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comments: [comment1])
    }
}
