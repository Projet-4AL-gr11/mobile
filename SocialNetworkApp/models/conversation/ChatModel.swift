//
//  ChatModel.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 20/06/2022.
//

import Foundation
class ChatModel: ObservableObject {
    var text = ""
    @Published var arrayOfMessages : [String] = []
    @Published var arrayOfPositions : [BubblePosition] = []
    @Published var position = BubblePosition.right
}
