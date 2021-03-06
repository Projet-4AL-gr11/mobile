//
//  EventSearch.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct EventSearch: Codable{
    let id : String
    let name: String
    let startDate: Date
    let endDate: Date
    let group: Group
    let language: Language
}
