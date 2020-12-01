//
//  ArticleModel.swift
//  izzNews
//
//  Created by Izzat Jabali on 24/11/20.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articlesRetrieved(_ articles:[Article])
}

class ArticleModel {
    
    var delgate:ArticleModelProtocol?
    
    func getArticles() {
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = "https://newsapi.org/v2/everything?q=apple&from=2020-11-07&to=2020-11-07&sortBy=popularity&apiKey=b5e1780800694e0ca49e8b908c4b5b5c"
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isnt nil
        guard url != nil else {
            print("Coudlnt create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                //Attempt t parse the JSON
                let decoder = JSONDecoder()
                
                do {
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    //Get the articles
                    let articles = articleService.articles!
                    
                    //Pass it back to the view controller in the main Thread
                    DispatchQueue.main.async {
                        
                        //self.delgate?.articlesRetrieved([Article]())
                        
                       self.delgate?.articlesRetrieved(articles)
                    }
                }
                catch {
                    print("Error parsing the json")
                }
                
            }
            
        }
        
        // Start the data task
        dataTask.resume()
    }
}
