//
//  ContentView.swift
//  Dicee-SwiftUi
//
//  Created by Abdelrahman Youssef on 04/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State var diceeOne: Int = 1
    @State var diceeTwo: Int = 1
    
    
    var body: some View {
        ZStack{
            Image("background").resizable().edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Image("diceeLogo")
                Spacer()
                HStack(){
                    DiceView(diceNumber: diceeOne)
                    DiceView(diceNumber: diceeTwo)
                }
                Spacer()
                Button(action: roll){
                    Text("Roll")
                        .font(.system(size: 30)).fontWeight(.heavy).padding(EdgeInsets.init(top: 10, leading: 30, bottom: 10, trailing: 30))
                }.background(Color("ButtonColor")).foregroundStyle(Color.white)
                    .clipShape(Capsule())

                Spacer()
                
            }.padding(.horizontal, 20)
        }
    }
    func roll(){
        diceeOne = Int.random(in: 1...6)
        diceeTwo = Int.random(in: 1...6)
    }
    
}

struct DiceView: View {
    let diceNumber: Int
    var body: some View {
        Image("dice\(diceNumber)").resizable().aspectRatio(1,contentMode: .fit)
    }
}


#Preview {
    ContentView()
}


