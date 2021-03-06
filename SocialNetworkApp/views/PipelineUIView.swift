//
//  PipelineUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct PipelineUIView: View {
    @State var searchText: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color("color_bg").edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack{
                        postCard(post: post1)
                        postCard(post: post1)
                        postCard(post: post1)
                        postCard(post: post1)
                        postCard(post: post1)
                        postCard(post: post1)
                        postCard(post: post1)
                        postCard(post: post1)
                    }
                }
                .navigationTitle("pipeline")
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
        PipelineUIView(searchText: "")
            .preferredColorScheme(.dark)
    }
}
