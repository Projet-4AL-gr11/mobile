//
//  GroupListView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 21/06/2022.
//

import SwiftUI

struct GroupListView: View {
    @StateObject var groupViewModel = GroupModelView()
    @State var searchText: String = ""
    @State var groupList: [Group]
    @State var groupMember: [GroupMembers] = []
    @State var showGroupView = false


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
                                Text(String(groupViewModel.groupList.count))
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 25)
                                    .background(.blue)
                                    .cornerRadius(50)
                            }
                            
                                                   
                            Divider()
                                .padding(.bottom, 20)
                            
                            VStack(spacing: 20){
                                ForEach(groupViewModel.groupList, id: \.self) { group in
                                NavigationLink(destination: GroupUIView(group: group, groupModelView: groupViewModel)){
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
            
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button{
                            self.showGroupView = true
                        }label: {
                            Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 77, height: 70)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                        }.sheet(isPresented: $showGroupView){
                            AddGroupView(text: "")
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
            .navigationTitle(Text("groupes"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear{
            groupViewModel.getGroup()
        }

        
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView(groupList: listGroupSample)
    }
}
