//
//  Exercise.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 06/06/2022.
//

import Foundation
struct Exercise: Identifiable{
      let id: String
      let name: String
      let events: [Event]
      let leaderboards: [LeaderBoard]
      let startingDate: Date
      let endingDate: Date
      let exerciseTemplate: ExerciseTemplate
}
