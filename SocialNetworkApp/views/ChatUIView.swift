//
//  ChatUIView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 20/06/2022.
//

import SwiftUI

struct ChatUIView: View {
    @ObservedObject var model = ChatModel()
        
        var body: some View {
            ZStack {
                Color("color_bg").edgesIgnoringSafeArea(.all)
                GeometryReader { geo in
                    VStack {
                        //MARK:- ScrollView
                        CustomScrollView(scrollToEnd: true) {
                            LazyVStack {
                                ForEach(0..<model.arrayOfMessages.count, id:\.self) { index in
                                    ChatBubbleView(position: model.arrayOfPositions[index], color: model.arrayOfPositions[index] == BubblePosition.right ?.green : .blue) {
                                        Text(model.arrayOfMessages[index])
                                    }
                                }
                            }
                        }.padding(.top)
                        //MARK:- text editor
                        HStack {
                            ZStack {
                                TextEditor(text: $model.text)
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke()
                                    .foregroundColor(.gray)
                            }.frame(height: 50)
                            
                            Button("Envoyer") {
                                if model.text != "" {
                                    model.position = model.position == BubblePosition.right ? BubblePosition.left : BubblePosition.right
                                    model.arrayOfPositions.append(model.position)
                                    model.arrayOfMessages.append(model.text)
                                    model.text = ""
                                }
                            }
                        }.padding()
                    }
                }
            }
        }
}

// struct ChatUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatUIView()
//    }
// }
