//
//  PostDto.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/07/2022.
//

import Foundation
struct PostDto: Codable, Hashable{
    let text: String
    let group: Group?
    let sharedEvent: SharedEvent?
    let sharesPost: PostTimeLine?
}
