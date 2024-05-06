//
//  ListData.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 06/05/2024.
//

import Foundation
class ListData {
    func listUsers() -> [User] {
        return [User(userName: "philippe", userImage: "men", passWord: "1234"),User(userName: "sandrine", userImage: "wooman", passWord: "5678")]
    }
}
