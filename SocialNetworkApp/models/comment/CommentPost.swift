//
//  CommentPost.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/09/2022.
//

import Foundation
struct CommentPost: Codable, Hashable {
    let id: String
    let text: String
    let createdAt: String
    let updatedAt: String?
    let deletedAt: String?
}
