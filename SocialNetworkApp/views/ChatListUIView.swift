//
//  ChatUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct ChatListUIView: View {
    @State var searchText: String = ""
    
    let users = ["Shezad", "Mathew", "Afna", "Jerin", "Catherine"]
    let messages = [
        ["user":"Catherine", "message":"Hi there, How's your work ? did you completed that cross platform app ? ", "time": "10:30 AM"],
        ["user":"Shezad", "message": "Are you available tomorrow at 3:30 pm ? i'd like to discuss about our new project", "time": "12:45 AM"],
        ["user":"Afna", "message": "Hey, is there any update for morning stand up meeting tomorrow ?", "time": "12:15 PM"],
        ["user":"Mathew", "message": "Wow, awesome! Thank you so much for your effort", "time": "4:30 AM"],
        ["user":"Jerin", "message": "Yeah, Let's meet tomrrow evening 5:30pm at coffe shop", "time": "8:17 AM"]]
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("color_bg").edgesIgnoringSafeArea(.all)
                VStack{
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading, spacing: 5){
                            
                            SearchCard(searchText: $searchText)
                            
                            OnlineUsersView(users: users)
                           
                            Divider()
                                .padding(.bottom, 20)
                            
                            VStack(spacing: 25){
                            ForEach(messages, id: \.self) { message in
                                NavigationLink(destination: ChatUIView()){
                                    ChatCard(
                                        userImage: String(describing: message["user"]!),
                                        userName: String(describing: message["user"]!),
                                        message: String(describing: message["message"]!),
                                        time: String(describing: message["time"]!)
                                    )
                                }
                                
                            }
                        }
                    }
                }
            }
            .padding(.top)
            .padding(.horizontal)
            }
            .navigationTitle(Text("Chats"))
            .toolbar{
                Image(systemName: "square.and.pencil")
                    .foregroundColor(Color("color_primary"))
                    .font(.title2)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}
struct ChatUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListUIView().preferredColorScheme(.dark)
    }
}

