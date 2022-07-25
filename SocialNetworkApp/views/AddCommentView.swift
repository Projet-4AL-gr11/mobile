//
//  AddCommentView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 24/07/2022.
//

import SwiftUI

struct AddCommentView: View {
    @StateObject var postManager = PostManager()
    var postId: String
    @State var comment: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .trailing, spacing: 15){
            TextField("commentaire", text: $comment)
                .frame(width: .infinity, height: 100, alignment: .center)
                .border(.gray)
                .cornerRadius(20)
            Button{
                if comment.count > 0{
                    postManager.addCommente(postId: postId, comment: comment)
                }
                dismiss()
            } label: {
                Text("Commenter")
            }
        }.padding()
        .navigationTitle("commentaire")
    }
}

struct addCommentView_Previews: PreviewProvider {
    static var previews: some View {
        AddCommentView(postId: "", comment: "")
    }
}
