//
//  allModelsMocked.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import Foundation
let user1 = User(id: "123", email: "bfen@gmail.com", username: "ben", userType: "USER", bio: "ede,kezlnfd,erkfl", profilePicture: nil)
let user2 = User(id: "123ded", email: "bfen@gmail.com", username: "bededn", userType: "USER", bio: "ede,kezlnfd,erkfl", profilePicture: nil)
let user3 = User(id: "12ede3", email: "bfen@gmail.com", username: "bezdn", userType: "USER", bio: "ede,kezlnfd,erkfl", profilePicture: nil)
let user4 = User(id: "1dezaa23", email: "bfen@gmail.com",username: "bzeren", userType: "USER", bio: "ede,kezlnfd,erkfl", profilePicture: nil)
let user5 = User(id: "1zdé23", email: "bfen@gmail.com", username: "beffn", userType: "USER", bio: "ede,kezlnfd,erkfl", profilePicture: nil)
let userList: [User] = [user1, user2, user3, user5, user4]


let group1 = Group(id: "group2", name: "GroupeName1", users: userList, picture: "" )
let group2 = Group(id: "group3", name: "GroupeName2", users: userList, picture: "" )
let group3 = Group(id: "group4", name: "GroupeName4", users: userList, picture: "" )

let listGroupSample = [group1, group2, group3]
let language1 = Language(id: "1", name: "py")
let sampleEvent = SharedEvent(id: "dzdde", name: "event1", description: "evenementchic", startDate: "2022-06_12", endDate: "2022-06_12", participantsLimit: 25, createdAt: "2022-06_12")

let samplePost = PostTimeLine(id: "eozid", text: "sample post", createdAt: "2022-06-12", updatedAt: "2022-06-12", deletedAt: nil, creator: user1, sharedEvent: nil, group: group1)
let post1 = PostTimeLine(id: "eozid", text: "sample post", createdAt: "2022-06-12", updatedAt: "2022-06-12", deletedAt: nil, creator: user1, sharedEvent: nil, group: group1)
let comment1 = Comment(id: "dzdefz", creator: user1, post: samplePost, text: "un commentaire", medias: nil, reported: nil, createdAt: "2022-06-12", updatedAt: nil, deletedAt: nil)

let chatModelSample = ChatModel()


