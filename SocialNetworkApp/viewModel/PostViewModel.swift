//
//  PostViewModel.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 13/06/2022.
//

import Foundation
class PostViewModel : ObservableObject {
    @Published var sharedPost: PostTimeLine?
    @Published var posts: [PostTimeLine] = []
    
    init() {
        getTimeline()
        sharedPost  = nil
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
    
    func makePost(text: String) -> Bool {
        let defaults = UserDefaults.standard
        var isDone: Bool = true

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return false
        }
                
        WebService.makePost(token: token, text: text) {result in
            
            switch result {
            case .success(let post):
                DispatchQueue.main.async {
                    self.sharedPost = post
                }
            case .failure(let error):
                isDone = false
                print("error can't retrieve data")
                print(error.localizedDescription)
            }
        }
        return isDone
    }
    
    func uploadMedia(postId: String, data: Data) -> Bool {
        let defaults = UserDefaults.standard
        var withImage = true

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return false
        }
        WebService.addMedia(token: token, postId: postId, file: data) {result in
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
