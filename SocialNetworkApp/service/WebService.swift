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
    
    static func getGroup(token: String, completion: @escaping (Result<[PostTimeLine], RetrievePostError>) -> Void) {
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
    
    static func like(token: String, completion: @escaping (Result<[PostTimeLine], RetrievePostError>) -> Void) {
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
    
    static func comment(token: String, completion: @escaping (Result<[PostTimeLine], RetrievePostError>) -> Void) {
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
    
    static func addMember(token: String, completion: @escaping (Result<[PostTimeLine], RetrievePostError>) -> Void) {
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
    
    static func deleteMember(token: String, completion: @escaping (Result<[PostTimeLine], RetrievePostError>) -> Void) {
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
}
