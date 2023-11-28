//
//  UserInfoViewModel.swift
//  NetworkURLSession
//
//  Created by Ziyadkhan on 27.11.23.
//

import Foundation

class UserInfoViewModel {
    
    let networkManager = NetworkManager()
    var items: User?
    var userID: Int?
    
    func getUserItems(userID: Int?, completion: @escaping () -> Void) {
        networkManager.getObjects(type: User.self,
                                  urlInput: "users/\(userID ?? 0)") { result in
            switch (result) {
            case .success(let userItem):
                self.items = userItem
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
