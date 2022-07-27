//
//  EventUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/07/2022.
//

import SwiftUI

struct EventUIView: View {
    @StateObject var eventViewModel: EventViewModel
    @State var searchText = ""
    var body: some View {
        ZStack {
            Color("color_bg").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 20){
                    if eventViewModel.events.count > 0 {
                        ForEach(eventViewModel.events, id: \.self) { event in
                            EventCard(event: event)
                                .padding()
                            
                            Divider()
                           
                        }
                    }
                }
            }
            .navigationTitle("Evenement")
            .toolbar{
                NavigationLink{
                    SearchView(searchText: searchText)
                }label:{
                    Image(systemName: "magnifyingglass")
                }
            }
        }
    }
}

struct EventUIView_Previews: PreviewProvider {
    static var previews: some View {
        EventUIView(eventViewModel: EventViewModel())
    }
}
