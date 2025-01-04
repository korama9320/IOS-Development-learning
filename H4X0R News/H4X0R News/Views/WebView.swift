//
//  WebView.swift
//  H4X0R News
//
//  Created by Abdelrahman Youssef on 04/01/2025.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable{
    let url : String?
  func makeUIView(context: Context) -> WKWebView {
      return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = url{
            if let safeURl = URL(string: safeString){
                let request = URLRequest(url: safeURl)
                uiView.load(request)
            }
        }
    }
    
}
