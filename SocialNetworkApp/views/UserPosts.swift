//
//  UserPosts.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/10/2022.
//

import SwiftUI

struct UserPosts: View {
    @State var searchText: String = ""
    @StateObject var postViemModel: PostViewModel
    @State var showPostView = false
    @State var user: User
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("color_bg").edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading){
                        if postViemModel.friendPost.count > 0 {
                            ForEach(postViemModel.friendPost, id: \.self) { post in
                                postCard(post: post)
                                
                            }
                        }
                    }
                }
                .navigationTitle("Timeline \(user.username)")
                .toolbar{
                    NavigationLink{
                        SearchView(searchText: searchText)
                    }label:{
                        Image(systemName: "magnifyingglass")
                    }
                    
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .onAppear{
            postViemModel.getFriendPosts(userId: user.id)
        }
    }
}


struct UserPosts_Previews: PreviewProvider {
    static var previews: some View {
        UserPosts(postViemModel: PostViewModel(), user: user1)
    }
}
