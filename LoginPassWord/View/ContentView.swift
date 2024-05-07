//
//  ContentView.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 05/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var listOfUsers:ListData = ListData()
    @State private var password: String = ""
    @FocusState private var focus:Bool
    @State private var isAuthenticated: Bool = false
    @State private var userChoise:Int = 0
    @State private var showAlert:Bool = false


    var body: some View {
        NavigationStack {
            ZStack{
                // fond
                Color.myGreen
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white).opacity(0.16)
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                Image((listOfUsers.listUsers()[userChoise].userImage))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150, height: 150)
                    .clipShape(Circle())
                    .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    .padding()
                    
                // picker de selection des utilisateurs
                Picker("Users", selection: $userChoise) {
                    ForEach(0..<listOfUsers.listUsers().count, id: \.self) { index in
                        Text("Utilisateur \(listOfUsers.listUsers()[index].userName)").tag(index)
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
                    .focused($focus)
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
                // Champ est à vide
                .onAppear {
                    focus = true
                    password = ""
                }
                
                .navigationDestination(isPresented: $isAuthenticated) {
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
                            Text("Vous etes logger sous: \(listOfUsers.listUsers()[userChoise].userName)").tag(userChoise)
                        }
                    }
                }
                .alert("Erreur", isPresented: $showAlert) {
                    //loginStatusMessage
                    Text("Erreur de connexion")
                    Button("OK", role: .cancel) { focus = true }
                    
                }
            }
            .padding()
            }
        }
        .navigationBarHidden(true)
        
        
        
            
    }
    
//authentification utilisateur
    func authenticateUser(password: String) {
        if  password == listOfUsers.listUsers()[userChoise].passWord {
            isAuthenticated = true
        } else {
            isAuthenticated = false
            showAlert.toggle()
        }
    }
}

#Preview {
    ContentView()
}
