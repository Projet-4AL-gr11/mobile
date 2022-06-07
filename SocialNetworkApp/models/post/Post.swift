//
//  Post.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct Post: Identifiable{
    let text: string;
    let creator: User;
    let group?: Group;
    let sharedEvent?: Event;
    let sharesPost?: Post;
}
