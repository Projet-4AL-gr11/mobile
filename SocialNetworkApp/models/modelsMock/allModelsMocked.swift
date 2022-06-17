//
//  allModelsMocked.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import Foundation
let user1 = User(id: "123az", username: "ben", email: "ben@gmail.com")
let group1 = Group(id: "group2", name: "firstGroup", users: [user1])
let language1 = Language(id: "1", name: "py")
let sampleEvent = Event(id: "12345", name: "live Coding",
                        description: "ensemble codons", startDate: Date(),
                        endDate: Date.now, participationLimit: 25, user: user1,
                        group: group1, language: language1)
let comment1 = Comment(id: "sdd146", creator: user1, post: nil, text: "ceci est un test comment", medias: nil, reported: nil, createdAt: Date.now, updatedAt: nil, deletedAt: nil)
let samplePost = Post(id: "123546", creator: user1, group: group1, sharedEvent: sampleEvent, likes: [user1], comments: [comment1], text: "sample text qui est en savons comment porter sortes", medias: nil, createdAt: Date.now, updatedAt: nil, deletedAt: nil)
let postDtoSample = PostDto(id: "hjh156", text: "ceci est un post Dto", creator: user1, group: group1, sharedEvent: sampleEvent, sharedPost: samplePost)
