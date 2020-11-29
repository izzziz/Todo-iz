//
//  Item.swift
//  TodoIz
//
//  Created by Izzat Jabali on 23/8/20.
//  Copyright © 2020 Izzat Jabali. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
   @objc dynamic var title: String = ""
   @objc dynamic var done: Bool = false
    @objc dynamic var doneCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
