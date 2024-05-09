//
//  ColorSwitchButton.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 08/05/2024.
//

import SwiftUI

struct ColorSwitchButton: View {
    @State private var listOfDatas:ListData = ListData()
    @Binding var colorChoise:Int
    
    
    var body: some View {
        NavigationStack() {
            ZStack {
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        switchColor()
                        
                    }) {
                        Image(systemName: "swatchpalette.fill")
                    }
                }
            }
        }
    }
    // permet de passer à l'index de couleur suivante
    func switchColor() {
        if colorChoise < listOfDatas.colorInterface().count - 1 {
            colorChoise += 1
        } else {
            colorChoise = 0
        }
    }
}

#Preview {
    ColorSwitchButton(colorChoise: .constant(0))
}
