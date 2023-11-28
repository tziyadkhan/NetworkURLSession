//
//  SelectedPhotoViewModel.swift
//  NetworkURLSession
//
//  Created by Ziyadkhan on 28.11.23.
//

import Foundation

class SelectedPhotoViewModel {
    
    let networkManager = NetworkManager()
    var items: [Photo]?
    
    func getPhotoItem(selectedID: Int?, completion: @escaping () -> Void) {
        networkManager.getObjects(type: [Photo].self,
                                  urlInput: "photos") { result in
            switch(result) {
            case .success(let photoItem):
                self.items = photoItem
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
