//
//  Post.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct PostDto: Codable{
    let id : String
    let text: String
    let creator: User
    let group: Group?
    let sharedEvent: Event?
    let sharedPost: Post
}
