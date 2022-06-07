//
//  File.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct ReportRequestDto: Identifiable{
    let creatorId: String
    let text: String
    let commentId: String
    let eventId: String
    let groupId: String
    let postId: String
    let userId: String
}
