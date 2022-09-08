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
    let creator: UserCreator
    let medias : [Media]?
    let sharedEvent: SharedEvent?
    let group: Group?
    let comments: [CommentPost]?
    //var sharesPost: String?
    //var sharedPosts: [PostTimeLine]?
}

