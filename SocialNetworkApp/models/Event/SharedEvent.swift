//
//  SharedEvent.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 16/07/2022.
//

import Foundation
struct SharedEvent: Codable, Hashable {
    let id, name, description, startDate, endDate: String
    let participantsLimit: Int
    let createdAt: String
}
