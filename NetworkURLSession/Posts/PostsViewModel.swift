//
//  PostsViewModel.swift
//  NetworkURLSession
//
//  Created by Ziyadkhan on 27.11.23.
//

import Foundation

class PostsViewModel {
    
    var items: [Post]?
    let networkManager = NetworkManager()
    
    func getPostItems(completion: @escaping () -> Void) {
        networkManager.getObjects(type: [Post].self,
                                  urlInput: "posts") { results in
            switch(results) {
            case .success(let post):
                self.items = post
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
