//
//  Users.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 05/05/2024.
//

import Foundation
import SwiftUI

struct User:Identifiable{
    var id: UUID = UUID()
    var userName:String
    var userImage: String
    var passWord:String
}
