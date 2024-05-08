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
                // image
                UserImage(image:.constant( (listOfUsers.listUsers()[userChoise].userImage)))
          
                    
                // picker de selection des utilisateurs
                PickerView(userChoise: $userChoise)
                .onChange(of: userChoise) {
                 password = ""
                isAuthenticated = false
                focus = true
                }
            
                SecureField("Mot de passe", text: $password)
                    .focused($focus)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .onSubmit() {
                        authenticateUser(password: password)
                    }
                    .onAppear {
                        focus = true
                        password = ""
                    }
               //
                Button("Connexion") {
                    authenticateUser(password: password)
                }
                .padding()
                .foregroundColor(.white)
                .background(.myGreen)
                .cornerRadius(5)
                
                
                // Ecran lorsque la connexion à réussi
                .navigationDestination(isPresented: $isAuthenticated) {
                    UserConnectedView(userConnected: .constant((listOfUsers.listUsers()[userChoise].userName)), index: .constant(userChoise))
                }
                // affiche la fenetre d'alerte
                .alert("Information", isPresented: $showAlert) {
                    Text("Echec de connexion !")
                    Button("OK", role: .cancel)  {focus = true}
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
