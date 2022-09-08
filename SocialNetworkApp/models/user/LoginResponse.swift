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
    let profilePicture: Media?
    let bannerPicture: Media?
    let currentHashedRefreshToken: String
    let jwtToken: String
}
