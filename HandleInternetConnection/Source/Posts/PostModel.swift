//
//  PostModel
//  HandleInternetConnection
//
//  Created by Tran Duc on 3/15/19.
//  Copyright © 2019 David Tran. All rights reserved.
//

import Foundation

struct PostModel {
    var title: String?
    var subreddit: String?
    
    init(title: String?, subreddit: String?) {
        self.title = title
        self.subreddit = subreddit
    }
}
