//
//  ChatScreen.swift
//  ChatAppStarter
//
//  Created by Andreas Schultz on 05.10.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct ChatScreen: View {
  
  @State var newMessageInput = ""
  
    var body: some View {
      NavigationView {
        VStack {
          ForEach(sampleConversation,id:\.messageId) { message in
            ChatRow(message: message)
          }
          Spacer()
          
          ZStack {
            Rectangle()
              .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 20)
              .stroke(lightGreyColor,lineWidth: 2)
              .padding()
            HStack {
              TextField("New message...",text:$newMessageInput,onCommit:{
                print("Send message")
              })
              .padding(30)
              Button(action: {
                print("send message")
              }, label: {
                Image(systemName: "paperplane")
                  .imageScale(.large)
                  .padding(30)
              })
            }
          }.frame(height:70)
        }.navigationBarTitle("Chat App")
        
      }
     
    }
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen()
    }
}
