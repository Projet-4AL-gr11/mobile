//
//  PipelineUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct PipelineUIView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    postCard(post: postDtoSample)
                    postCard(post: postDtoSample)
                    postCard(post: postDtoSample)
                    postCard(post: postDtoSample)
                    postCard(post: postDtoSample)
                    postCard(post: postDtoSample)
                    postCard(post: postDtoSample)
                    postCard(post: postDtoSample)

                }
            }
            .navigationTitle("pipeline")
        }
    }
}

struct PipelineUIView_Previews: PreviewProvider {
    static var previews: some View {
        PipelineUIView()
    }
}
