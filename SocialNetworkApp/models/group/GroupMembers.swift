//
//  GroupMembers.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 25/07/2022.
//

import Foundation
struct GroupMembers: Codable, Hashable {
    let isAdmin: Bool
    let isOwner: Bool
    let createdAt: String
    let group: Group
    let user: User
}
