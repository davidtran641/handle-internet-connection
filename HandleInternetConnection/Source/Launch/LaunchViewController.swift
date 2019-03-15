//
//  LaunchViewController.swift
//  HandleInternetConnection
//
//  Created by Tran Duc on 3/15/19.
//  Copyright © 2019 David Tran. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    lazy var network = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network.isUnreachable { _ in
            showOfflinePage()
        }
        
        network.isReachable { _ in
            showMainPage()
        }
    }
    
    private func showOfflinePage() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "NetworkUnavailable", sender: self)
        }
    }
    
    private func showMainPage() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "MainController", sender: self)
        }
    }
    
}


