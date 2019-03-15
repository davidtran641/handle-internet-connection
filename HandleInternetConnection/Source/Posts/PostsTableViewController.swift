//
//  PostsTableViewController.swift
//  HandleInternetConnection
//
//  Created by Tran Duc on 3/15/19.
//  Copyright © 2019 David Tran. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    private var posts = [PostModel]()
    private lazy var postInteractor = PostInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Latest Posts"
        
        postInteractor.fetchPosts { [weak self] (data, error) in
            guard let self = self, let data = data else {
                return
            }
            self.posts = data
            self.tableView.reloadData()
        }
        
    }
}

//MARK: TableView Datasource
extension PostsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.subreddit
        return cell
    }
}

//MARK: TableView Delegate
extension PostsTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
