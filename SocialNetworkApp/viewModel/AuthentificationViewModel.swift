//
//  AuthentificationService.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 10/06/2022.
// https://iosacademy.io/api/v1/courses/index.php

import Foundation
import SwiftUI

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

struct LoginResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}

class Webservice {

    func login(username: String, password: String, completion: @escaping(Result < String,
        AuthenticationError > ) -> Void) {
        
        let url = URL(string: "http://www.stackoverflow.com")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
        
 //       func decodeAPI(){
  //          guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{return}
//
  //          let task = URLSession.shared.dataTask(with: url){
    //            data, response, error in
      //
        //        let decoder = JSONDecoder()
 
          
        //if let data = data{
          //          do{
            //            let tasks = try decoder.decode([Post].self, from: data)
              //          tasks.forEach{ i in
                //            print(i.title)
                  //      }
                //    }catch{
                  //      print(error)
                 //   }
               // }
            //}
            //task.resume()

        //}

        
        // Creating the JSON Object here -> unique with each option
        
        
       /* guard
        let loginResponse =  //unique for each option
            else {
                completion(.failure(.invalidCredentials))
                print("error")
                return
            }

        guard
        let token = loginResponse.token
        else {
            completion(.failure(.invalidCredentials))
            return
        }
        completion(.success(token))
    }.resume()
    */
    }
}


class LoginViewModel: ObservableObject {

    @Published var loginAlert = false
    @Published var isAuthenticated: Bool = false

    var username: String = ""
    var password: String = ""

    func login() {

        let defaults = UserDefaults.standard

        Webservice().login(username: username, password: password) {
            result in
                switch result {
                    case.success(let token):
                        defaults.setValue(token, forKey: "tokenName")
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                    }
                    case.failure(let error):
                        self.loginAlert = true
                    print(error.localizedDescription)
                }
        }
    }

    func signout() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "tokenName")
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
}
