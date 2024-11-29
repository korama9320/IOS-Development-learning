//
//  SwiftUIView.swift
//  abdo card
//
//  Created by Roboost Mobile on 08/09/2024.
//

import SwiftUI

struct CardItem: View {
    let info : String
    let icon : String
    var body: some View {
        
        Capsule().frame(height:50).foregroundColor(.white).padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20)).overlay(HStack{
            Image(systemName: icon)
            Text(info).font(.system(size:20)).foregroundColor(.black)
        })
    }
}

#Preview {
    
    CardItem(info:"+201004379033",icon:"phone.fill" )
}
