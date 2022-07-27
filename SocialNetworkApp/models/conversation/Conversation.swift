//
//  Conversation.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct Conversation: Codable{
    let id: String
    let friendship: FriendfShip
    //let messages: [Message]
    let group: Group
    let createdAt: Date
}
