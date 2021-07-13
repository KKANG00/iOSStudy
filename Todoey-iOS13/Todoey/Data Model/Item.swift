//
//  Item.swift
//  Todoey
//
//  Created by KKANG on 2021/07/13.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct Item {
    var contents: String
    var done: Bool = false
    
    init(_ contents: String) {
        self.contents = contents
    }
}
