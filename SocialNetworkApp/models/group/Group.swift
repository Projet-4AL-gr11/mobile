//
//  Group.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct Group: Codable{
    let id : String
    let name: String
    let users: [User]
 }
