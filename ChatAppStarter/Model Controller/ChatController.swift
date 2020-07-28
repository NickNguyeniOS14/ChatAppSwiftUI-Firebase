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
  
  // Observe real time database
  // “Now every time a message gets added to the database, we try to fetch that message’s data and to retrieve the username and content from it. If the message is not empty (which shouldn’t be the case), we create a new ChatMessage instance out of the retrieved data and append it to our messages array. We then call the send method of our objectWillChange property for telling the ChatScreen view that it should rebuild itself to display the new message.”
  //
  
  func receiveMessages() {
    let query = databaseChats.queryLimited(toLast: 100)
    _ = query.observe(.childAdded, with: { [weak self] snapshot in
      if let data = snapshot.value as? [String: String],
         let retrievedUsername = data["username"],
         let retrievedMessageText = data["messageText"],
         !retrievedMessageText.isEmpty {
        let retrievedMessage = ChatMessage(messageText: retrievedMessageText, username: retrievedUsername)
        self?.messages.append(retrievedMessage)
        self?.objectWillChange.send(self!)
      }
    })
  }
  
}
