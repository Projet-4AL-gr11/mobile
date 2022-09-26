//
//  WebService.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 13/06/2022.
//

import Foundation
import SwiftUI


struct WebService {
    
    enum LoginError: Error {
        case invalidURL
        case custom(Message: String)
    }
    
    enum RetrievePostError: Error {
        case invalidURL
        case custom(Message: String)
    }

    
    static func loginWithSession(pusername: String, ppassword: String, completion: @escaping (Result<LoginResponse, LoginError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:3000/auth/login") else{
            completion(.failure(.custom(Message: "url no valide")))
            return
        }
        let body = Login(username: pusername, password: ppassword)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, reponse, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.custom(Message: "invalide Credential")))
                return
            }
            
            completion(.success(loginResponse))
             
        }.resume()

    }
    
    static func getTilmeLine(token: String, completion: @escaping (Result<[PostTimeLine], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/post/getTimeLine/0/100") else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let posts = try? JSONDecoder().decode([PostTimeLine].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            completion(.success(posts))
            
        }.resume()
        
    }
    
    static func getEvent(token: String, completion: @escaping (Result<[SharedEvent], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/event/") else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let events = try? JSONDecoder().decode([SharedEvent].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }

            print(events.self)
            
            completion(.success(events))
            
        }.resume()
        
    }
    
    
    
    static func makePost(token: String, text:String, completion: @escaping (Result<PostTimeLine, RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/post/") else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        let body = PostDto(text: text, group: nil, sharedEvent: nil , sharesPost: nil)
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let post = try? JSONDecoder().decode(PostTimeLine.self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            completion(.success(post))
            
        }.resume()
        
    }
    
    static func createGroup(token: String, name:String, completion: @escaping (Result<GroupResponse, RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/group/") else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        let body = GroupRequest(name: name, user: nil)
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let group = try? JSONDecoder().decode(GroupResponse.self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }
            completion(.success(group))
            
        }.resume()
        
    }
    
    static func getGroup(token: String, completion: @escaping (Result<[Group], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/group/") else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let groups = try? JSONDecoder().decode([Group].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }
            completion(.success(groups))
            
        }.resume()
        
    }
    
    static func getGroupMembers(token: String, groupId: String, completion: @escaping (Result<[GroupMembers], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/group/members/" + groupId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let members = try? JSONDecoder().decode([GroupMembers].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }
            completion(.success(members))
            
        }.resume()
        
    }
    
    static func likePost(token: String, postId: String, completion: @escaping (Result<Any, RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/post/like/" + postId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            
            completion(.success(data.self))
            
        }.resume()
        
    }
    
    static func addCommente(token: String, postId: String, comment: String, completion: @escaping (Result<[Comment], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/comment/" + postId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        let body = CommentDto(text: comment)
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let responses = try? JSONDecoder().decode([Comment].self, from: data) else {
                completion(.failure(.custom(Message: "invalide Credential")))
                return
            }
            completion(.success(responses.self))
        }.resume()
    }
    
    
    
    static func dislikePost(token: String, postId: String, completion: @escaping (Result<Any, RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/post/dislike/" + postId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            
            completion(.success(data.self))
            
        }.resume()
        
    }
    
    static func getComment(token: String, postId: String, completion: @escaping (Result<[Comment], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/comment/getPostComments/" + postId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let comments = try? JSONDecoder().decode([Comment].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            completion(.success(comments))
        }.resume()
    }
    
    static func getFriends(token: String, userId: String, completion: @escaping (Result<[User], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/user/friendships/" + userId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let friends = try? JSONDecoder().decode([User].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            completion(.success(friends))
        }.resume()
        
    }
    
    
    static func getUserById(token: String, userId: String, completion: @escaping (Result<User, RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/user/" + userId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let user = try? JSONDecoder().decode(User.self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            completion(.success(user))
        }.resume()
        
    }
    
    static func getUserByName(token: String, name: String, completion: @escaping (Result<[User], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/user/researchUsername/" + name) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let user = try? JSONDecoder().decode([User].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            completion(.success(user))
        }.resume()
        
    }
    
    
    
    static func getLikes(token: String, postId: String, completion: @escaping (Result<[User], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/post/like/" + postId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let user = try? JSONDecoder().decode([User].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            completion(.success(user))
        }.resume()
        
    }
    
    static func isLiked(token: String, postId: String, completion: @escaping (Result<Bool, RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/post/is-liked/" + postId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let response = try? JSONDecoder().decode(Bool.self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            completion(.success(response))
        }.resume()
        
    }

    
    static func share(token: String, completion: @escaping (Result<[PostTimeLine], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/post/getTimeLine/0/100") else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let posts = try? JSONDecoder().decode([PostTimeLine].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }
            completion(.success(posts))
        }.resume()
        
    }
    
    static func getGroupMember(token: String, groupId: String, completion: @escaping (Result<[User], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/group/followers/" + groupId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let users = try? JSONDecoder().decode([User].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }
            completion(.success(users))
        }.resume()
        
    }
    
    static func joinGroup(token: String, groupId: String, user: User, completion: @escaping (Result<Any, RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/group/addFollower/" + groupId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        let body = user
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            print("join=group ok")
            completion(.success(data.self))
        }.resume()
        
    }
    
    static func deleteMember(token: String, groupId: String, completion: @escaping (Result<Any, RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/group/removeFollower/" + groupId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            completion(.success(data.self))
        }.resume()
    }
        
    static func getFriendsList(token: String, userId: String, completion: @escaping (Result<[User], RetrievePostError>) -> Void) {
        guard let url = URL(string: "localhost:3000/user/friendships/" + userId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(Message: "no data")))
                return
            }
            guard let posts = try? JSONDecoder().decode([User].self, from: data) else {
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }
            completion(.success(posts))
            
        }.resume()
        
    }
    // don' touvh this part i spend a lot of time on !!
    static func uploadImage(token: String, imageData: Data, postId: String,  completion: @escaping (Result<Bool, RetrievePostError>) -> Void) {
        // generate boundary string using a unique string
        let boundary = UUID().uuidString
        guard let url = URL(string: "http://localhost:3000/media/postPicture/"+postId) else{
            completion(.failure(.custom(Message: "network error")))
            return
        }
        // Set the URLRequest to POST and to the specified URL
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        // Content-Type is multipart/form-data, this is the same as submitting form data with file upload
        // in a web browser
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        let paramName = "file"
        let mimetype = "image/jpeg"
        let fileName = UUID().uuidString+".jpeg"
        var data = Data()
        // Add the file data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: \(mimetype)\r\n\r\n".data(using: .utf8)!)
        data.append(imageData)
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        // do not forget to set the content-length!
        request.setValue(String(data.count), forHTTPHeaderField: "Content-Length")
        request.httpBody = data
        print("in that damn function")
        URLSession.shared.uploadTask(with: request, from: data).resume()
            
    }
}
