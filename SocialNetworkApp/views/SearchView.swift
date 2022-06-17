//
//  SearchView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var body: some View {
        VStack{
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Search", text: $searchText)
                        .foregroundColor(.primary)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(15)
                .foregroundColor(.secondary)
                .background(Color("color_bg_inverted").opacity(0.05))
                .clipShape(Capsule())
        }
        .padding(.vertical)
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//       SearchView(searchText: "test")
//    }
//}
