//
//  ContentView.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 05/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var listUsers:[User] = [User(userName: "philippe", userImage: "men", passWord: "1234"),User(userName: "sandrine", userImage: "wooman", passWord: "5678")]
    @State private var password: String = ""
    @State private var isAuthenticated: Bool = false
    @State private var userChoise:Int = 0

    
    var body: some View {
        VStack {
            Image((listUsers[userChoise].userImage))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:150, height: 150)
                .clipShape(Circle())
                .padding()
                
            // picker de selection des utilisateurs
            Picker("Users", selection: $userChoise) {
                ForEach(0..<listUsers.count, id: \.self) { index in
                    Text("Utilisateur \(listUsers[index].userName)").tag(index)
                }
            
            }
            .pickerStyle(.automatic)
            .onChange(of: userChoise) {
             password = ""
            isAuthenticated = false
            
            }
        
            SecureField("Mot de passe", text: $password)
                .onSubmit() {
                    authenticateUser(password: password)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            Button("Connexion") {
                authenticateUser(password: password)
            }
            .padding()
            .foregroundColor(.white)
            .background(isAuthenticated ? Color.green : Color.blue)
            .cornerRadius(5)
            loginStatusMessage
        }
        .padding()
    }
//authentification utilisateur
    func authenticateUser(password: String) {
        if  password == listUsers[userChoise].passWord {
            isAuthenticated = true
        } else {
            isAuthenticated = false
        }
    }

    var loginStatusMessage: some View {
        Text(isAuthenticated ? "Connecté avec succès!" : "Échec de la connexion")
            .foregroundColor(isAuthenticated ? .green : .red)
    }
}

#Preview {
    ContentView()
}
