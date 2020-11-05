//
//  HomeScreenViewController.swift
//  TeamIO
//
//  Created by Ari Jain on 10/12/20.
//

import UIKit

class HomeScreenViewController: UIViewController {

    let homeScreenView = HomeScreenView()
    
    override func loadView() {
        view = homeScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        NotificationCenter.default.addObserver(forName: .customTransition, object: nil, queue: OperationQueue.main) { (notification) in
            self.customTransition()
        }

            
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return .lightContent
    }
    
    @objc func customTransition() {
        let deviceHistoryController = DeviceHistoryController()
        navigationController?.pushViewController(deviceHistoryController, animated: true)
    }
}
