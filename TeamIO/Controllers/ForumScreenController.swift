//
//  ForumScreenController.swift
//  TeamIO
//
//  Created by Ari Jain on 10/27/20.
//

import Foundation
import UIKit

class ForumScreenController: UIViewController {
    let forumSelectionView = ForumSelectionView()
    
    override func loadView() {
         view = forumSelectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
