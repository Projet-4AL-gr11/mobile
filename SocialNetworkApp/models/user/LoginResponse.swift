//
//  LoginResponse.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 11/07/2022.
//

import Foundation
struct LoginResponse: Codable {
    let id: String?
    let username: String?
    let profilePicture: String?
    let bannerPicture: String?
    let currentHashedRefreshToken: String
    let jwtToken: String
}
