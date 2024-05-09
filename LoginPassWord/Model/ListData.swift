//
//  ListData.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 06/05/2024.
//

import Foundation
import SwiftUI
class ListData {
    func listUsers() -> [User] {
        return [User(userName: "titastus.com", userImage: "titastus.com", passWord: "1969"),
                 User(userName: "philippe", userImage: "men", passWord: "1234"),
                 User(userName: "Sandrine", userImage: "wooman", passWord: "5678")]
    }
    
    func colorInterface() -> [Color] {
        return [.myGreen, .blue, .myRed, .yellow, .cyan, .orange, .indigo,.mint,.brown, .pink,.purple,.gray]
    }
}
