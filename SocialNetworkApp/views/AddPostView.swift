//
//  AddPostView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/07/2022.
//

import SwiftUI

struct AddPostView: View {
    @StateObject var postViewModel = PostViewModel()
    @State var text: String = ""
    @State var message = ""
    @State private var showToast = false
    @Environment(\.dismiss) var dismiss
       
    var body: some View {
        VStack(alignment: .trailing, spacing: 15){
            TextField("ajouter un pos", text: $text)
                .frame(width: .infinity, height: 100, alignment: .center)
                .border(.gray)
                .cornerRadius(20)
            Button{
                if text.count > 0{
                    message = postViewModel.makePost(text: text) ? "Poste ajouté" : "erreur"
                    postViewModel.getTimeline()
                    self.showToast.toggle()
                }
                dismiss()
            } label: {
                Text("Publier")
            }.alert(isPresented: $showToast) {
                Alert(title: Text(message))
                
            }
        }.padding()
        .navigationTitle("Ajouter un post")
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}

