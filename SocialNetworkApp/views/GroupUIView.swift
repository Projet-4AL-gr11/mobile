//
//  GroupUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 29/05/2022.
//

import SwiftUI

struct GroupUIView: View {
    var columns = [GridItem(.adaptive(minimum: 90), spacing: 20)]
    @State var group: Group
    @State var searchText: String = ""
    var body: some View {
        NavigationView {
            ZStack{ 
                Color("color_bg").edgesIgnoringSafeArea(.all)
                VStack{
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading, spacing: 5){
                           SearchCard(searchText: $searchText)
                            HStack{
                                Text("Participants:")
                                    .font(.title3)
                                    .bold()
                                Text(String(group.users.count))
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 25)
                                    .background(.orange)
                                    .cornerRadius(50)
                            }
                            
                                                   
                            Divider()
                                .padding(.bottom, 20)
                            
                            LazyVGrid(columns: columns, spacing: 20){
                                ForEach(group.users, id: \.self) { user in
                                NavigationLink(destination: ChatUIView()){
                                    UserCard(user: user)
                                }
                                
                            }
                        }
                    }
                }
            }
            .padding(.top)
            .padding(.horizontal)
            }
            .navigationTitle(Text(group.name))
            .toolbar{
                Image(systemName: "square.and.pencil")
                    .foregroundColor(Color("color_primary"))
                    .font(.title2)
        }
        }
    }
}

struct GroupUIView_Previews: PreviewProvider {
    static var previews: some View {
        GroupUIView(group: group1)
    }
}
