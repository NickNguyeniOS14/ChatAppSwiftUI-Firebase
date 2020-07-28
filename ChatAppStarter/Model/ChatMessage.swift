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
  
  init(messageText: String, username: String) {
    self.messageText = messageText
    self.username = username
    if UserDefaults.standard.string(forKey: "username") == username {
      self.isMe = true
    } else {
      self.isMe = false
    }
  }
}
