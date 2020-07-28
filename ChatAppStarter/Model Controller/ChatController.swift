//
//  ChatController.swift
//  ChatAppStarter
//
//  Created by Nick Nguyen on 7/28/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ChatController: ObservableObject {
  var messages = [ChatMessage]()
  
  let objectWillChange = PassthroughSubject<ChatController,Never>()
  
  func sendMessage(messageText: String) {
    // Generate a new child of database
    let newChat = databaseChats.childByAutoId()
    let messageToSend = ["username": UserDefaults.standard.string(forKey: "username") ?? "Unknown user", "messageText": messageText]
    // Create new chat and to add it to Firebase database
    newChat.setValue(messageToSend)
    
  }
  func receiveMessages() {
    
  }
  
}
