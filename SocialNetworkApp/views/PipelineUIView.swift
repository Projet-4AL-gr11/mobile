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
    @State var showPostView = false

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
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button{
                            self.showPostView = true
                        }label: {
                            Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 77, height: 70)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                        }.sheet(isPresented: $showPostView){
                            AddPostView(text: "")
                            
                        }
                        
                        .background(Color.green)
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
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
