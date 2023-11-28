//
//  UsersViewModel.swift
//  NetworkURLSession
//
//  Created by Ziyadkhan on 27.11.23.
//

import Foundation

class UsersViewModel {
    
    let networkManager = NetworkManager()
    var items: [User]?
    var userID: Int?
    
    func getUserItems(completion: @escaping () -> Void) {
        networkManager.getObjects(type: [User].self,
                                  urlInput: "users") { result in
            switch (result) {
            case .success(let userItem):
                self.items = userItem
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
