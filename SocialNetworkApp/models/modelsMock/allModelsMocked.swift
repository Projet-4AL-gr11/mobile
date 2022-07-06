//
//  allModelsMocked.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import Foundation
let user1 = User(id: "123", username: "ben", email: "ben@gmail.com")
let user2 = User(id: "123az", username: "adam", email: "ben@gmail.com")
let user4 = User(id: "123azr", username: "omar", email: "ben@gmail.com")
let user5 = User(id: "123aze", username: "jean", email: "ben@gmail.com")
let user6 = User(id: "123azs", username: "thierry", email: "ben@gmail.com")
let userList: [User] = [user1, user2, user4, user5, user6]


let group1 = Group(id: "group2", name: "GroupeName1", users: userList)
let group2 = Group(id: "group3", name: "GroupeName2", users: userList)
let group3 = Group(id: "group4", name: "GroupeName4", users: userList)

let listGroupSample = [group1, group2, group3]
let language1 = Language(id: "1", name: "py")
let sampleEvent = Event(id: "12345", name: "live Coding",
                        description: "ensemble codons", startDate: Date(),
                        endDate: Date.now, participationLimit: 25, user: user1,
                        group: group1, language: language1)
let comment1 = Comment(id: "sdd146", creator: user1, post: nil, text: "ceci est un test comment", medias: nil, reported: nil, createdAt: Date.now, updatedAt: nil, deletedAt: nil)
let samplePost = Post(id: "123546", creator: user1, group: group1, sharedEvent: sampleEvent, likes: [user1], comments: [comment1], text: "sample text qui est en savons comment porter sortes", medias: nil, createdAt: Date.now, updatedAt: nil, deletedAt: nil)
let postDtoSample = PostDto(id: "hjh156", text: "ceci est un post Dto", creator: user1, group: group1, sharedEvent: sampleEvent, sharedPost: samplePost)
let chatModelSample = ChatModel()


