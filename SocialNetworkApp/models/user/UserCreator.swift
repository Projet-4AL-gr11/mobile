//
//  UserCreator.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 05/09/2022.
//

import Foundation

struct UserCreator: Codable, Hashable {
    let id, email, username, userType, bio: String
    let profilePicture: Media?
}
