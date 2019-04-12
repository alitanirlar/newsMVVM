//
//  NewsTableViewController.swift
//  NewsMVVM
//
//  Created by Ali Tanırlar on 12.04.2019.
//  Copyright © 2019 Ali Tanırlar. All rights reserved.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    //MARK: - UI Setup
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=YOUR NEWS API KEY")
        Webservice().getArticles(url: url!) { articles in
            
            if let articles = articles {
                          self.articleListViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
  
        }
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSection
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 
        // #warning Incomplete implementation, return the number of rows
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell not found")}
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.configure(articleViewModel)
        return cell
    }


}
