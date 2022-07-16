//
//  SearchView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20){
                    SearchCard(searchText: $searchText)
                }
                .navigationTitle(Text("recherche"))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
       SearchView(searchText: "")
    }
}
