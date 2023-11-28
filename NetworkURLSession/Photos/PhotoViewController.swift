//
//  PhotoViewController.swift
//  NetworkURLSession
//
//  Created by Ziyadkhan on 28.11.23.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    var items: [Photo]?
    let photoViewModel = PhotoViewModel()
    let photoURL = "https://jsonplaceholder.typicode.com/photos"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotoObjects()

    }
}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionCell", for: indexPath) as! PhotoCollectionCell
        cell.imageTitle.text = items?[indexPath.item].title
        
        if let imageURLString = items?[indexPath.item].url,
        let imageURL = URL(string: imageURLString) {
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                if let imageData = data {
                    DispatchQueue.main.async {
                        cell.image.image = UIImage(data: imageData)
                    }
                }
            }.resume()
        }
        return cell
    }
}

extension PhotoViewController {
    func getPhotoObjects() {
        guard let url = URL(string: photoURL) else {return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    self.items = try JSONDecoder().decode([Photo].self, from: data)
                    DispatchQueue.main.async {
                        self.collection.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
