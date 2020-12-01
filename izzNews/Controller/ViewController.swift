//
//  ViewController.swift
//  izzNews
//
//  Created by Izzat Jabali on 24/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = ArticleModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set the viewController as the datasource and delegate of the tableView.
        tableView.delegate = self
        tableView.dataSource = self
        
        // Get the articles from the article model.
        model.delgate = self
        model.getArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Detect the indexpath the user selected
       let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else {
            //The user hasnt selected anything
            return
            
        }
        
        // Get the article the user tapped on
        let article = articles[indexPath!.row]
        
        // Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // Pass the article url to the detail view controller
        detailVC.articleUrl = article.url!
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        // Get the article that the table view is asking about
        let article = articles[indexPath.row]
        
        // Customize it
        cell.displayArticle(article)
        
        // Return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController: ArticleModelProtocol {
    
    // MARK: - Article Model Protocol Methods
    
    func articlesRetrieved(_ articles: [Article]) {
        
        // Set the articles property of the view controller to the articles passed back from the model
        self.articles = articles
        
        // Refresh the tableView
        tableView.reloadData()
    }
}


