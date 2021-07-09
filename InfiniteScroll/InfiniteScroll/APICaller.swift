//
//  APICaller.swift
//  InfiniteScroll
//
//  Created by KKANG on 2021/07/08.
//

import Foundation

class APICaller {
    func fetchData(paginaton: Bool = false, completion:  @escaping (Result<[String], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now()+1, execute: {
            let originalData = ["Apple", "Google", "Facebook"]
            
            let newData = ["new1", "new2", "new3"]
            
            completion(.success(paginaton ? newData : originalData))
        })
    }
}
