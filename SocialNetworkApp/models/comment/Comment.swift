//
//  Comment.swift
//  SocialNetworkApp
// iosacademy.io/api/v1/courses/index.php
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation

struct Comment: Codable{
    let id: String
    let creator: User
    let post: PostTimeLine?
    let text: String
    let medias: [Media]?
    let reported: [ReportResponse]?
    let createdAt: String
    let updatedAt: String?
    let deletedAt: String?
}
