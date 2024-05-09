//
//  ContentView.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 05/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var listOfDatas:ListData = ListData()
    @State private var password: String = ""
    @FocusState private var focus:Bool
    @State private var isAuthenticated: Bool = false
    @State private var userChoice:Int = 0
    @State private var showAlert:Bool = false
    @State private var colorInterface = 0

    var body: some View {
        NavigationStack {
            ZStack{
                ColorSwitchButton(colorChoice: $colorInterface)
                Color(listOfDatas.colorInterface()[colorInterface])
                    .ignoresSafeArea()
                //vue design
                InterfaceDesignView()
            VStack {
                // titre app
                TitleView()
                // image
                UserImage(image:.constant( (listOfDatas.listUsers()[userChoice].userImage)))
          
                    
                // picker de selection des utilisateurs
                PickerView(userChoice: $userChoice)
                .onChange(of: userChoice) {
                 password = ""
                isAuthenticated = false
                focus = true
                }
            
                // champs mot de passe
                SecureField("Mot de passe", text: $password)
                    .focused($focus)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .onSubmit() {
                        authenticateUser(password: password)
                    }
                // initialisation du champs mot de passe
                // du focus champs mot de passe
                    .onAppear {
                        focus = true
                        password = ""
                    }
               // bouton de validation
                Button("Connexion") {
                    authenticateUser(password: password)
                }
                .padding()
                .foregroundColor(.white)
                .background(listOfDatas.colorInterface()[colorInterface])
                .cornerRadius(5)
                
                // Ecran lorsque la connexion à réussi
                .navigationDestination(isPresented: $isAuthenticated) {
                    UserConnectedView(userConnected: .constant((listOfDatas.listUsers()[userChoice].userName)), index: .constant(userChoice))
                }
                // affiche la fenetre d'alerte si mot de passe incorrect
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
        if  password == listOfDatas.listUsers()[userChoice].passWord {
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
