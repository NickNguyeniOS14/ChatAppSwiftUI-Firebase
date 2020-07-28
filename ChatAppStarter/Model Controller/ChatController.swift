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
}
