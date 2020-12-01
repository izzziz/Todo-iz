//
//  CacheManager.swift
//  izzNews
//
//  Created by Izzat Jabali on 24/11/20.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(_ url:String, _ imageData:Data) {
        
        // Save the image data along with the URL
        imageDictionary[url] = imageData
        
    }
    
    static func retrieveData(_ url:String) -> Data? {
        
        // Return the saved image data nil
        return imageDictionary[url]
    }
}
