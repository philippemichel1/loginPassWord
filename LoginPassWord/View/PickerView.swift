//
//  PickerView.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 08/05/2024.
//

import SwiftUI

struct PickerView: View {
    @State private var listOfUsers:ListData = ListData()
    @Binding var userChoice:Int
    
    var body: some View {
        Picker("Users", selection: $userChoice) {
            ForEach(0..<listOfUsers.listUsers().count, id: \.self) { index in
                Text("Utilisateur \(listOfUsers.listUsers()[index].userName)").tag(index)
                    .foregroundStyle(.black)
            }
        }
        .pickerStyle(.automatic)
    }
}

#Preview {
    PickerView(userChoice: .constant(0))
}
