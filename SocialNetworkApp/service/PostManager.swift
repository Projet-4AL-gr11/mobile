//
//  PostManager.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 24/07/2022.
//

import Foundation
class PostManager: ObservableObject {
    @Published var likes: [User] = []
    @Published var comments: [Comment] = []
    @Published var isLiked: Bool = true
    
    func initializer(postId: String){
        self.getLikes(postId: postId)
        self.isLiked(postId: postId)
        self.getComments(postId: postId) 
    }
    
    func getLikes(postId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        
        print("here you should get the token : \(token)")
        
        WebService.getLikes(token: token, postId: postId ) {result in
            
            switch result {
            case .success(let likes):
                DispatchQueue.main.async {
                    self.likes = likes
                }
            case .failure(let error):
                print("can't get likes")
                print(error.localizedDescription)
            }
        }
    }
    
    func isLiked(postId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        
        print("here you should get the token : \(token)")
        
        WebService.isLiked(token: token, postId: postId ) {result in
            
            switch result {
            case .success(let liked):
                DispatchQueue.main.async {
                    self.isLiked = liked
                }
            case .failure(let error):
                print("can't get islike")
                print(error.localizedDescription)
            }
        }
    }
    
    func getComments(postId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        
        print("here you should get the token : \(token)")
        
        WebService.getComment(token: token, postId: postId ) {result in
            
            switch result {
            case .success(let comments):
                DispatchQueue.main.async {
                    self.comments = comments
                }
            case .failure(let error):
                print("can't get comments")
                print(error.localizedDescription)
            }
        }
    }
    
    func like(postId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.likePost(token: token, postId: postId) {result in
            
            switch result {
            case .success( _):
                print("post \(postId) liked")
                DispatchQueue.main.async {
                    self.isLiked = true
                }
            case .failure(let error):
                print("error can't like post")
                print(error.localizedDescription)
            }
        }
    }
    
    func dislike(postId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.dislikePost(token: token, postId: postId) {result in
            
            switch result {
            case .success( _):
                print("post \(postId) disliked")

                DispatchQueue.main.async {
                    self.isLiked = false
                }
            case .failure(let error):
                print("error can't like dislike")
                print(error.localizedDescription)
            }
        }
    }
    
    func addCommente(postId: String, comment: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.addCommente(token: token, postId: postId, comment: comment) {result in
            
            switch result {
            case .success(let comments):
                print("post \(postId) commented")
                DispatchQueue.main.async {
                    self.comments = comments
                }
            case .failure(let error):
                print("error can't add comment")
                print(error.localizedDescription)
            }
        }
    }
}
