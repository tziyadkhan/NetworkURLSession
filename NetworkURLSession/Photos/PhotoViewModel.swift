//
//  PhotoViewModel.swift
//  NetworkURLSession
//
//  Created by Ziyadkhan on 28.11.23.
//

import Foundation

class PhotoViewModel {
    
    var items: [Photo]?
    let networkManager = NetworkManager()
    
    func getPhotoObjects(completion: @escaping () -> Void) {
        networkManager.getObjects(type: [Photo].self,
                                  urlInput: "photos") { results in
            switch(results) {
            case .success(let photoItems):
                self.items = photoItems
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
