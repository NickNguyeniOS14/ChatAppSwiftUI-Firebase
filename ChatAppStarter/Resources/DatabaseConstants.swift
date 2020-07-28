//
//  DatabaseConstants.swift
//  ChatAppStarter
//
//  Created by Nick Nguyen on 7/28/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import Firebase

let databaseRoot = Database.database().reference()
let databaseChats = databaseRoot.child("chats")
