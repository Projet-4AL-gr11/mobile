//
//  EventViewModel.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 13/06/2022.
//

import Foundation
class EventViewModel : ObservableObject {
    
    @Published var events: [SharedEvent] = []
    
    init() {
        getEvent()
    }
    
    func getEvent(){
        let defaults = UserDefaults.standard

        guard let token = defaults.string(forKey: "jwtToken") else {
            print("can't get token")
            return
        }
            
        WebService.getEvent(token: token) {result in
            
            switch result {
            case .success(let events):
                DispatchQueue.main.async {
                    self.events = events
                }
            case .failure(let error):
                print("error can't retrieve data")
                print("another print for token: \(token)")
                print(error.localizedDescription)
            }
        }
    }
}
