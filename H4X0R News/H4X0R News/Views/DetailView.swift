//
//  DetailView.swift
//  H4X0R News
//
//  Created by Abdelrahman Youssef on 04/01/2025.
//

import SwiftUI

struct DetailView: View {
    let url : String?
    var body: some View {
        WebView(url: url)
    }
}

#Preview {
    DetailView(url: "https://stackoverflow.com/questions/75371971/instance-method-requires-that-classname-conform-to-decodable")
}
