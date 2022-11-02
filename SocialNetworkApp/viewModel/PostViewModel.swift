//
//  PostViewModel.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 13/06/2022.
//

import Foundation
class PostViewModel : ObservableObject {
    @Published var posts: [PostTimeLine] = []
    @Published var friendPost: [PostTimeLine] = []

    
    init() {
        getTimeline()
    }
    
    func getTimeline(){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
            
        WebService.getTilmeLine(token: token) {result in
            
            switch result {
            case .success(let post):
                DispatchQueue.main.async {
                    self.posts = post
                }
            case .failure(let error):
                print("impossible de decoder les posts")
                print(error.localizedDescription)
            }
        }
    }
    
    func getFriendPosts(userId: String){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
            
        WebService.getFriendPosts(token: token, userId: userId) {result in
            
            switch result {
            case .success(let post):
                DispatchQueue.main.async {
                    self.friendPost = post
                }
            case .failure(let error):
                print("impossible de decoder les posts")
                print(error.localizedDescription)
            }
        }
    }
    
    func makePost(text: String, media: Data?) {
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
        WebService.makePost(token: token, text: text) {result in
            switch result {
            case .success(let post):
                if media != nil {
                    print("niveau media ok")
                    let _ = self.uploadImage(postId: post.id, data: media!)
                }
            case .failure(let error):
                print("error can't retrieve data")
                print(error.localizedDescription)
            }
        }
        return
    }
    
    func uploadImage(postId: String, data: Data) -> Bool {
        let defaults = UserDefaults.standard
        var withImage = true

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return false
        }
        WebService.uploadImage(token: token, imageData: data, postId: postId) {result in
            switch result {
            case .success(_):
                self.getTimeline()
            case .failure(let error):
                print("error can't add post Media")
                print(error.localizedDescription)
                withImage = false
            }
        }
        return withImage
    }

}
