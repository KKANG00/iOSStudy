//
//  ViewController.swift
//  GalleryApp
//
//  Created by KKANG on 2021/07/15.
//

import UIKit

var cachedImage: [URL:UIImage] = [:]

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellSpacing: CGFloat = 1
    let lineSpacing: CGFloat = 5
    let columns: CGFloat = 3
    
    var images: [URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let plist = Bundle.main.url(forResource: "URLs", withExtension: "plist"), let contents = try? Data(contentsOf: plist),let properties = try? PropertyListSerialization.propertyList(from: contents, format: nil), let urls = properties as? [String]
              else { return }
        
        images = urls.compactMap{ URL(string: $0) }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

}

class ImageItemCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func showImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    
    func downloadImage(_ withUrl: URL) {
        // networking 비동기 처리
        DispatchQueue.global(qos: .utility).async { [weak self] in
            // [weak self] 약한 참조를 위한 guard문
            guard let self = self else { return }
            
            if let cachedImage = cachedImage[withUrl] {
                self.showImage(cachedImage)
            }
            else {
                if let data = try? Data(contentsOf: withUrl), let safeImage = UIImage(data: data) {
                    // 이미지 캐싱 저장
                    cachedImage[withUrl] = safeImage
                    
                    self.showImage(safeImage)
                }
            }
            
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageItemCell", for: indexPath) as! ImageItemCell
        
        cell.downloadImage(images[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - cellSpacing * (columns-1))/columns
        return CGSize(width: width, height: width)
    }
    
    
    
}
