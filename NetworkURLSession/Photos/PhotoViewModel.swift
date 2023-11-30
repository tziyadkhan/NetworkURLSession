//
//  PhotoViewModel.swift
//  NetworkURLSession
//
//  Created by Ziyadkhan on 28.11.23.
//

import Foundation

class PhotoViewModel {
    
    let service: NetworkManagerService
    init(service: NetworkManagerService) {
        self.service = service
    }
    var items: [Photo]?
    
    func getPhotoObjects(completion: @escaping () -> Void) {
        service.getObjects(type: [Photo].self,
                           urlInput: "photos") { results in
            switch(results) {
            case .success(let photoItems):
                self.items = photoItems
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
