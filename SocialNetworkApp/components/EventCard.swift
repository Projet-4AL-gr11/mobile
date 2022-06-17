//
//  EventCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 13/06/2022.
//

import SwiftUI

struct EventCard: View {
    var event: Event
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                Image("python")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text(event.description)
                        .font(.title)
                    Text(event.name)
                }
                
            }
            HStack{
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person.2")
                            .resizable()
                        .frame(width: 50, height: 50)
                        let limitation = String(event.group.users.count) + " / " + String(event.participationLimit)
                        Text(limitation)
                            .padding()
                        
                    }
                    HStack {
                        Image(systemName: "calendar")
                            .resizable()
                        .frame(width: 50, height: 50)
                        Text("20-12-2022")
                            .padding()
                    }
                    HStack{
                        Image(systemName: "alarm")
                            .resizable()
                        .frame(width: 50, height: 50)
                        let limitation = String(event.group.users.count) + " / " + String(event.participationLimit)
                        Text(limitation)
                            .padding()
                    }
                }
                
                Image(systemName: "chevron.left.forwardslash.chevron.right")
                    .frame(width: 40, height: 40)
                    .font(.title)
                VStack(alignment: .trailing){
                    Text("goupe Only")
                        .font(.title2)
                        .bold()
                    Text(event.language.name)
                        .frame(width: 70, height: 30)
                        .font(.title3)
                        .background(.red)
                        .cornerRadius(20)
                        .padding(.trailing)
                    Button(action: {}){
                        Text("Participer")
                            .frame(width: 100, height: 30)
                            .foregroundColor(.white)
                            .font(.headline)
                            .background(.green)
                            .cornerRadius(30)
                            .shadow(radius: 10)
                            .padding(.top, 70)
                        
                    }
                    .padding()
                }
                .padding()
            }
            HStack{
                Button(action: {}){
                    Image(systemName: "hand.thumbsup")
                    Text("J'aime")
                }
                Spacer()
                Button(action: {}){
                    Image(systemName: "message")
                    Text("Comment")
                }
                Spacer()
                Button(action: {}){
                    Image(systemName: "square.and.arrow.up")
                    Text("Partager")
                }
            }
                
        }
        .padding()
        .border(.black, width: 2)
        .shadow(radius: 2)
        .cornerRadius(20)

    }

}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard(event: sampleEvent)
    }
}
