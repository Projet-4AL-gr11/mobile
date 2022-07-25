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
                print("can't decode data")
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }

            print(posts.self)
            
            completion(.success(posts))
            
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
                print("can't decode data")
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }

            print(groups.self)
            
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
                print("can't decode data")
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }

            print(members.self)
            
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
                print("can't decode data")
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            print(comments.self)
            completion(.success(comments))
            
        }.resume()
    }
    
    static func getFriends(token: String, userId: String, completion: @escaping (Result<[User], RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/user/frienddhips/" + userId) else{
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
                print("can't decode data")
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            print(friends.self)
            completion(.success(friends))
            
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
                print("can't decode data")
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            print(user.self)
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
                print("can't decode data")
                completion(.failure(.custom(Message: "unable to deserialize data")))
                return
            }
            print(response.self)
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
                print("can't decode data")
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }

            print(posts.self)
            
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
                print("can't decode data")
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }

            print(users.self)
            
            completion(.success(users))
            
        }.resume()
        
    }
    
    static func joinGroup(token: String, groupId: String, completion: @escaping (Result<Any, RetrievePostError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/group/addFollower/" + groupId) else{
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
            print(data.self)
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
            print(data.self)
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
                print("can't decode data")
                completion(.failure(.custom(Message: "unable to deserialize data")))
                
                return
            }

            print(posts.self)
            
            completion(.success(posts))
            
        }.resume()
        
    }
}
