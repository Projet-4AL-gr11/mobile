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
    @StateObject var groupModelView: GroupModelView
    @State var searchText: String = ""
    @State var showMemberView = false

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
                                if groupModelView.groupMembers.count > 0 {
                                    Text(String(groupModelView.groupMembers.count))
                                        .foregroundColor(.white)
                                        .frame(width: 25, height: 25)
                                        .background(.blue)
                                        .cornerRadius(50)
                                } else{
                                    Text(String("0"))
                                        .foregroundColor(.white)
                                        .frame(width: 25, height: 25)
                                        .background(.blue)
                                        .cornerRadius(50)
                                }
                            }
                            
                                                   
                            Divider()
                                .padding(.bottom, 20)
                            
                            LazyVGrid(columns: columns, spacing: 20){
                               
                                if groupModelView.groupMembers.count > 0 {
                                    ForEach(groupModelView.groupMembers, id: \.self) { member in
                                        NavigationLink(destination: ChatUIView()){
                                            UserCard(user: member.user)
                                        }
                                    }
                                }
                                else {
                                    Text("pas de membres dans ce groupe")
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
                            self.showMemberView = true
                        } label: {
                            Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 77, height: 70)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                        }.sheet(isPresented: $showMemberView){
                            AddMemberView(text: "", group: group)
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
            .navigationTitle(Text(group.name))
            .toolbar{
                Image(systemName: "square.and.pencil")
                    .foregroundColor(Color("color_primary"))
                    .font(.title2)
        }
        }.onAppear(perform: fetch)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    private func fetch(){
        groupModelView.getGroupMembers(groupId: group.id)
    }
}

struct GroupUIView_Previews: PreviewProvider {
    static var previews: some View {
        GroupUIView(group: group1, groupModelView: GroupModelView())
    }
}
