//
//  Category.swift
//  TodoIz
//
//  Created by Izzat Jabali on 23/8/20.
//  Copyright © 2020 Izzat Jabali. All rights reserved.
//

import Foundation
import RealmSwift

//Realm Object
// The way to save to Realm

class Category: Object {
   @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
    
}
