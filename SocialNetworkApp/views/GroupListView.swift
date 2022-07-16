//
//  GroupListView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 21/06/2022.
//

import SwiftUI

struct GroupListView: View {
    @State var searchText: String = ""
    @State var groupList: [Group]
    var body: some View {
        NavigationView{
            ZStack{
                Color("color_bg").edgesIgnoringSafeArea(.all)
                VStack{
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading, spacing: 5){
                            SearchCard(searchText: $searchText)
                            HStack{
                                Text("Groupes:")
                                    .font(.title3)
                                    .bold()
                                Text(String(groupList.count))
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 25)
                                    .background(.orange)
                                    .cornerRadius(50)
                            }
                            
                                                   
                            Divider()
                                .padding(.bottom, 20)
                            
                            VStack(spacing: 20){
                                ForEach(groupList, id: \.self) { group in
                                NavigationLink(destination: GroupUIView(group: group)){
                                    GroupCard(group: group)
                                }
                                Divider()
                                
                            }
                        }
                    }
                }
            }
            .padding(.top)
            .padding(.horizontal)
            }
            .navigationTitle(Text("groupes"))
        }
        .navigationViewStyle(StackNavigationViewStyle())

        
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView(groupList: listGroupSample)
    }
}
