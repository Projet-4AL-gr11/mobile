//
//  allModelsMocked.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 17/06/2022.
//

import Foundation
let user1 = User(id: "123", email: "bfen@gmail.com", username: "ben", userType: "USER", bio: "ede,kezlnfd,erkfl", profilePicture: nil, bannerPicture: nil)
let user2 = User(id: "123ded", email: "bfen@gmail.com", username: "bededn", userType: "USER", bio: "ede,kezlnfd,erkfl", profilePicture: nil, bannerPicture: nil)
let user3 = User(id: "12ede3", email: "bfen@gmail.com", username: "bezdn", userType: "USER", bio: "ede,kezlnfd,erkfl", profilePicture: nil, bannerPicture: nil)
let user4 = User(id: "1dezaa23", email: "bfen@gmail.com",username: "bzeren", userType: "USER", bio: "ede,kezlnfd,erkfl", profilePicture: nil, bannerPicture: nil)
let user5 = User(id: "1zdé23", email: "bfen@gmail.com", username: "beffn", userType: "USER", bio: "ede,kezlnfd,erkfl", profilePicture: nil, bannerPicture: nil)
let userList: [User] = [user1, user2, user3, user5, user4]
let userCreator = UserCreator(id: "56459", email: "creator@gmail.Com", username: "usernameC", userType: "USER", bio: "mybio here", profilePicture: nil)

let group1 = Group(id: "group1", name: "rfreferfrferf", picture: nil, bannerPicture: nil)
let group2 = Group(id: "group2", name: "r'(g'gzerfe", picture: nil, bannerPicture: nil)
let group3 = Group(id: "group3", name: "rfrr'éreé", picture: nil, bannerPicture: nil)

let listGroupSample = [group1, group2, group3]
let language1 = Language(id: "1", name: "py")
let sampleEvent = SharedEvent(id: "dzdde", name: "event1", description: "evenementchic", startDate: "2022-06_12", endDate: "2022-06_12", participantsLimit: 25, createdAt: "2022-06_12")

let samplePost = PostTimeLine(id: "eozid", text: "sample post", createdAt: "2022-06-12", updatedAt: "2022-06-12", deletedAt: nil, creator: userCreator, medias: nil, sharedEvent: nil, group: group1, comments: nil)
let post1 = PostTimeLine(id: "eozid", text: "sample post It is not subsequently refreshing the data when it is changed online. I have tried using .onAppear and also .refreshable unsuccessfully. I need to delete the App and re-install for it to go and fetch the updated data.", createdAt: "2022-06-12", updatedAt: "2022-06-12", deletedAt: nil, creator: userCreator, medias: nil, sharedEvent: nil, group: group1, comments: nil)
let comment1 = Comment(id: "edezdzde", text: "Got this new Nas shit on heavy rotation.been a Nas fan since 93,sittin here crying and celebrating my accomplishments!! 🍾🍾Salute to all of the listeners,much wealth and long life to you and your family,these past 2 years has been really crazy but we've all came a long way!! (May YHWH continue to watch over all of us!!)...(Not trying to be too religious on here.but that's just who i am as a person)", createdAt: "2022-06-12", updatedAt: nil, deletedAt: nil, creator: userCreator, medias: nil)

let endPoint = "https://pa-lsa-bucket.s3.us-east-2.amazonaws.com/"

let chatModelSample = ChatModel()


