//
//  ContentView.swift
//  H4X0R News
//
//  Created by Abdelrahman Youssef on 04/01/2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkMannager: NetworkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkMannager.posts) { post in
                PostTile(post: post)
            }
            .navigationBarTitle("H4X0R News")
        }
        .onAppear { self.networkMannager.fetchNews() }
    }
}


struct PostTile: View {
    let post: Post
    var body: some View {
        NavigationLink(destination: DetailView(url: post.url)) {
            
            HStack{
                Text(String(post.points))
                Text(post.title)
            }
        }
    }
}

#Preview {
    ContentView()
}
