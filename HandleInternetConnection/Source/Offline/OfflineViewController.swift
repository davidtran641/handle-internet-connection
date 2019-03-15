//
//  OfflineViewController.swift
//  HandleInternetConnection
//
//  Created by Tran Duc on 3/15/19.
//  Copyright © 2019 David Tran. All rights reserved.
//

import UIKit

class OfflineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.reachability.whenReachable = { [weak self] _ in
            self?.showMainPage()
        }
    }
    
    private func showMainPage() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "MainController", sender: self)
        }
    }

}
