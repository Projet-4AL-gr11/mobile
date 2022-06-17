//
//  Message.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct Message: Codable{
     let id: String
     let content: String
     let author: User
     let conversation: Conversation
     let createdAt: Date
}
