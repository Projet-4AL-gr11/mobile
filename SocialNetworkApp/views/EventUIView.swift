//
//  EventUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/07/2022.
//

import SwiftUI

struct EventUIView: View {
    var post: PostTimeLine
    var body: some View {
        List{
            //ForEach(post.sharedEvent)
        }
    }
}

struct EventUIView_Previews: PreviewProvider {
    static var previews: some View {
        EventUIView(post: samplePost)
    }
}
