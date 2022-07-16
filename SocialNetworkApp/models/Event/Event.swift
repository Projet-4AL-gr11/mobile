//
//  Event.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct Event: Codable{
    let id : String
    let name: String
    let description: String
    let startDate: Date
    let endDate: Date
    let participantsLimit: Int
    let createdAt: Date
    //let user: User
    //let group: Group
    //let language: Language
}


