//
//  ChatMessage.swift
//  ChatAppStarter
//
//  Created by Nick Nguyen on 7/28/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import Foundation

class ChatMessage {
  let messageText: String
  let username: String
  let isMe: Bool
  let messageId = UUID()
  
  init(messageText: String, username: String, isMe: Bool) {
    self.messageText = messageText
    self.username = username
    self.isMe = isMe
  }
}

let sampleConversation = [
  ChatMessage(messageText: "Hello how are you?", username: "Me", isMe: true),
  ChatMessage(messageText: "I'm fine and you?", username: "Another user", isMe: false),
  ChatMessage(messageText: "I'm fine as well. Thanks for asking. What are you doing right now?", username: "Me", isMe: true)
]
