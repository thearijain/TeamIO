//
//  ForumSelectionView.swift
//  TeamIO
//
//  Created by Ari Jain on 10/27/20.
//

import Foundation
import UIKit

class ForumSelectionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    func sharedInit() {
        overrideUserInterfaceStyle = .light
        backgroundColor = hexStringToUIColor(hex: "#222222")
    }
    
    override func layoutSubviews() {
        addSubview(forumLabel)
        addSubview(tableView)
        
        setupAllConstraints()
    }
    
    func setupAllConstraints() {
        setupForumLabelConstraints()
        setupTableViewConstraints()
    }
    
    let tableView = ForumTableView()
    
    let forumLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Forum"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    func setupForumLabelConstraints() {
        forumLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forumLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 13),
            forumLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            forumLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            forumLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: forumLabel.bottomAnchor, constant: 20),
            tableView.widthAnchor.constraint(equalTo: self.widthAnchor),
            tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
