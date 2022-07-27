//
//  GroupRepsonse.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/07/2022.
//

import Foundation
struct GroupResponse: Codable, Hashable{
    let id: String
    let name: String
    let members: [GroupMembers]?
}
