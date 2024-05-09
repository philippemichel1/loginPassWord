//
//  InterfaceDesignView.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 09/05/2024.
//

import SwiftUI

struct InterfaceDesignView: View {
    var body: some View {
        //création de cercles
        Circle()
            .scale(1.7)
            .foregroundColor(.white).opacity(0.16)
        Circle()
            .scale(1.35)
            .foregroundColor(.white)
    }
}

#Preview {
    InterfaceDesignView()
}
