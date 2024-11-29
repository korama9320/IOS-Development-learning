//
//  ContentView.swift
//  abdo card
//
//  Created by Roboost Mobile on 07/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 1.0, green: 0.5, blue: 0.3).ignoresSafeArea()
            VStack{
                Image("profile").resizable().aspectRatio(contentMode:.fill).frame(width:150,height: 150).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(lineWidth: 3).foregroundColor(.white))
                Text("Abdelrahman Youssef").font(.custom("Pacifico-Regular", size: 30)).foregroundColor(.white)
                Text("Mobile Developer").font(.system(size: 25)).foregroundColor(.white)
                Divider()
                CardItem(info: "+201004379033", icon: "phone.fill")
                CardItem(info: "3bdo9320@gmail.com", icon: "envelope.fill")
            }
        }
     
    }
}

#Preview {
    ContentView()
}
