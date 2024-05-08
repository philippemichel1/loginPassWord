//
//  UserImage.swift
//  LoginPassWord
//
//  Created by Philippe MICHEL on 08/05/2024.
//

import SwiftUI

struct UserImage: View {
    @Binding var image:String
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:150, height: 150)
            .clipShape(Circle())
            .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding()
    }
}

#Preview {
    UserImage(image: .constant("wooman"))
}
