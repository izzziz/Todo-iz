//
//  Article.swift
//  izzNews
//
//  Created by Izzat Jabali on 24/11/20.
//

import Foundation

struct Article : Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImages:String?
    var publishedAt:String?
    
    
}
