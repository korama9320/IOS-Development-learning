//
//  ContentView.swift
//  I_AM_RICH
//
//  Created by Roboost Mobile on 07/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.2, green: 0.7, blue: 0.6).ignoresSafeArea()
            VStack{
                
                Image("diamond").resizable().aspectRatio(contentMode: .fit).frame(width: 200,height: 200,alignment: .center)
                Text("I AM RICH").fontWeight(.bold).font(.system(size:40)).foregroundColor(Color.white)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
