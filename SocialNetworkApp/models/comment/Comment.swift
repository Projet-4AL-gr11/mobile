//
//  Comment.swift
//  SocialNetworkApp
// iosacademy.io/api/v1/courses/index.php
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation

struct Comment: Codable, Hashable{
    let id: String
    let text: String
    let createdAt: String
    let updatedAt: String?
    let deletedAt: String?
    let creator: UserCreator
    let medias: [Media]?
    //let reported: [ReportResponse]?
    
}
