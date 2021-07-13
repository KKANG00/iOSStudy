//
//  ViewController.swift
//  TableViewPractice
//
//  Created by KKANG on 2021/07/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    let data: [UIImage] = [#imageLiteral(resourceName: "test4"), #imageLiteral(resourceName: "test6"), #imageLiteral(resourceName: "test8"), #imageLiteral(resourceName: "test3"), #imageLiteral(resourceName: "test5"), #imageLiteral(resourceName: "test1"), #imageLiteral(resourceName: "test9"), #imageLiteral(resourceName: "test2"), #imageLiteral(resourceName: "test7"), #imageLiteral(resourceName: "test4"), #imageLiteral(resourceName: "test6"), #imageLiteral(resourceName: "test8"), #imageLiteral(resourceName: "test3"), #imageLiteral(resourceName: "test5"), #imageLiteral(resourceName: "test1"), #imageLiteral(resourceName: "test9"), #imageLiteral(resourceName: "test2"), #imageLiteral(resourceName: "test7"), #imageLiteral(resourceName: "test4"), #imageLiteral(resourceName: "test6"), #imageLiteral(resourceName: "test8"), #imageLiteral(resourceName: "test3"), #imageLiteral(resourceName: "test5"), #imageLiteral(resourceName: "test1"), #imageLiteral(resourceName: "test9"), #imageLiteral(resourceName: "test2"), #imageLiteral(resourceName: "test7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CollectionView.dataSource = self
        CollectionView.delegate = self
        CollectionView.register(customCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

class customCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! customCollectionViewCell
        cell.imageView.image = data[indexPath.row]
        cell.label.text = "만화 \(indexPath.row+1)"
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    // 아이템 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/5)
//        print(collectionView.frame.width/3)
        return CGSize(width: 120, height: 150)
    }

    // 최소간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }

//    // 위아래 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
//    }
}

