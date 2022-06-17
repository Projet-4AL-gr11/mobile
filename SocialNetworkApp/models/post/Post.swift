//
//  Post.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import Foundation
struct Post: Codable{
    
    let id: String
    let creator: User
    let group: Group
    let sharedEvent: Event
    
   // let sharedPosts: [Post]?
  
    // let sharesPost: Post?
  
    let likes: [User]
  
    let comments: [Comment]
  
  
    let text: String
  
    let medias: [Media]?

  
    //let reported: [Report]

  
    let createdAt: Date
  
    let updatedAt: Date?

    let deletedAt: Date?
}
