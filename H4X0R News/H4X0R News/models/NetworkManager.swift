//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Abdelrahman Youssef on 04/01/2025.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchNews() {
        if  let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
             if error==nil {
                let decoder = JSONDecoder()
                 if let news=data{
                     do{
                      let results =   try decoder.decode(Results.self, from: news)
                         DispatchQueue.main.async{
                             self.posts = results.hits
                         }
                     }catch{
                             print(error)
                         }
                 }
                }
            
          
            }
            
            task.resume()
            
         
        }
        }
}
