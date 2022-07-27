//
//  GroupeRequest.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/07/2022.
//

import Foundation
struct GroupRequest: Codable, Hashable{
    let name: String
    let user: [User]?
}
