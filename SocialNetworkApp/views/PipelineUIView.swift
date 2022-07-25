//
//  PipelineUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct PipelineUIView: View {
    @State var searchText: String = ""
    @StateObject var postViemModel: PostViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("color_bg").edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading){
                        if postViemModel.posts.count > 0 {
                            ForEach(postViemModel.posts, id: \.self) { post in
                                postCard(post: post)
                               
                            }
                        }
                    }
                }
                .navigationTitle("Accueil")
                .toolbar{
                    
                    NavigationLink{
                        SearchView(searchText: searchText)
                    }label:{
                        Image(systemName: "magnifyingglass")
                    }
                        
            }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PipelineUIView_Previews: PreviewProvider {
    static var previews: some View {
        PipelineUIView(searchText: "", postViemModel: PostViewModel())
            .preferredColorScheme(.dark)
    }
}
