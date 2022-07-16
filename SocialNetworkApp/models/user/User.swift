//
//  User.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation

struct User: Codable, Hashable {
    let id, email, username, userType, bio: String
    let profilePicture: String?
}
