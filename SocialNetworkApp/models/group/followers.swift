//
//  followers.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 26/09/2022.
//

import Foundation
struct GroupFollowers: Codable, Hashable {
    let id, email, username, userType, bio: String
    let profilePicture: Media?
    let followedGroups: [FollowedGroup]?
    
}

struct FollowedGroup: Codable, Hashable {
    let id: String
    let name: String
}
