//
//  PostTimeLine.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import Foundation
struct PostTimeLine: Codable, Hashable{
    
    let id, text : String
    let createdAt, updatedAt, deletedAt: String?
    let creator: User
    let sharedEvent: SharedEvent?
    let group: Group?
    let comments: [Comment]?
}


        
