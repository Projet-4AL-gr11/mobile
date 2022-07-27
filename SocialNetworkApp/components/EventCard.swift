//
//  EventCard.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/07/2022.
//

import SwiftUI

struct EventCard: View {
    let event: SharedEvent
    var body: some View {
        HStack(alignment: .bottom, spacing: 20){
            VStack(alignment: .leading, spacing: 10){
                HStack(alignment: .top, spacing: 20) {
                    Image(systemName: "curlybraces")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .cornerRadius(20)
                        .foregroundColor(.green)
                    Text(event.name)
                        .font(.title2)
                        .bold()
                }
                .padding(.bottom, 10)
                
                Text(event.description.prefix(50))
                    .font(.body)
            
                Text(event.startDate + " à " + event.endDate)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .bold()
            }
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 180, height: 120)
                    .foregroundColor(.white)
                    .background(.green)
                VStack(spacing: 20){
                    Text("Participants")
                        .font(.title3)
                        .bold()
                    Text(String(event.participantsLimit))
                        .font(.largeTitle)
                        .bold()
                }
            }
        }
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard(event: sampleEvent)
    }
}
