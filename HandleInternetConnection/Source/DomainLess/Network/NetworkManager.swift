//
//  NetworkManager.swift
//  HandleInternetConnection
//
//  Created by Tran Duc on 3/15/19.
//  Copyright © 2019 David Tran. All rights reserved.
//

import Foundation
import Reachability

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    private(set) var reachability: Reachability!
    
    private override init() {
        super.init()
        reachability = Reachability()
        observeNotification()
        startNotifier()
    }
    
    private func observeNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(networkStatusChanged(_:)), name: nil, object: reachability)
    }
    
    @objc private func networkStatusChanged(_ notification: Notification) {
        
    }
    
    func stopNotifier() {
        reachability.stopNotifier()
    }
    
    func startNotifier() {
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start reachability")
        }
    }
    
    func isReachable(completed: (NetworkManager) -> Void) {
        if reachability.connection != .none {
            completed(self)
        }
    }
    
    func isUnreachable(completed: (NetworkManager) -> Void) {
        if reachability.connection == .none {
            completed(self)
        }
    }
    
    func isReachableViaWifi(completed: (NetworkManager) -> Void) {
        if reachability.connection != .wifi {
            completed(self)
        }
    }
    
    func isReachableViaWWAN(completed: (NetworkManager) -> Void) {
        if reachability.connection != .cellular {
            completed(self)
        }
    }
    
}

