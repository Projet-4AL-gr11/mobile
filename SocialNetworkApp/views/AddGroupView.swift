//
//  AddGroupView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/07/2022.
//

import SwiftUI

struct AddGroupView: View {
    @StateObject var groupViewModel = GroupModelView()
    @State var text: String = ""
    @Environment(\.dismiss) var dismiss
    @State var showToast = false
    @State var message = ""
       
    var body: some View {
        VStack(alignment: .trailing, spacing: 15){
            TextField("Nom du groupe", text: $text)
                .frame(width: .infinity, height: 50, alignment: .center)
                .border(.gray)
                .cornerRadius(20)
            Button{
                if text.count > 0{
                    message = groupViewModel.createGroup(name: text) ? "groupe créée" : "erreur"
                    self.showToast.toggle()
                }
                dismiss()
            } label: {
                Text("Creer")
            }.alert(isPresented: $showToast) {
                Alert(title: Text(message))
                
            }
            
            
            
        }.padding()
        .navigationTitle("Creer un groupe")
    }
}

struct AddGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddGroupView()
    }
}
