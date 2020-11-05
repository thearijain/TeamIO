//
//  DeviceHistoryController.swift
//  TeamIO
//
//  Created by Ari Jain on 10/26/20.
//

import Foundation
import UIKit

class DeviceHistoryController: UIViewController {
    let deviceHistoryView = DeviceHistoryView()
    
    override func loadView() {
         view = deviceHistoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}


