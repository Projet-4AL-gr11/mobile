//
//  Group.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct Group: Codable, Hashable{
    let id : String
    let name: String
    let picture: Media?
    let bannerPicture: Media?

 }
