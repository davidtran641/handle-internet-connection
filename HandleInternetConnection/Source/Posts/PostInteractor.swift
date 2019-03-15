//
//  PostInteractor.swift
//  HandleInternetConnection
//
//  Created by Tran Duc on 3/15/19.
//  Copyright © 2019 David Tran. All rights reserved.
//

import Foundation
import Alamofire

class PostInteractor {
    
    func fetchPosts(complete: @escaping (_ response: [PostModel]?, _ error: Error?) -> Void) {
        Alamofire.request("https://api.reddit.com").validate().responseJSON { response in
            switch response.result {
            case .success(let json):
                guard let jsonObject = json as? [String: AnyObject],
                    let data = jsonObject["data"] as? [String: AnyObject],
                    let children = data["children"] as? [AnyObject] else {
                    complete(nil, nil)
                    return
                }
                let posts = children.compactMap { child -> PostModel? in
                    guard let post = child["data"] as? [String: AnyObject] else {
                        return nil
                    }
                    return PostModel(title: post["title"] as? String, subreddit: "/r/" + (post["subreddit"] as? String ?? ""))
                }
                complete(posts, nil)
            
            case .failure(let error):
                complete(nil, error)
                
            }
        }
    }
}
