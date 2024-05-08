//
//  UserConnectedView.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 08/05/2024.
//

import SwiftUI

struct UserConnectedView: View {
    @Binding var userConnected:String
    @Binding var index:Int
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white).opacity(0.16)
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
            VStack {
                Text("Vous etes connecté sous : \(userConnected)").tag(index)
                    .font(.title)
                    .padding()
                    .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    UserConnectedView(userConnected: .constant("nom"), index: .constant(0))
}
