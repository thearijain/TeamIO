//
//  ForumTableView.swift
//  TeamIO
//
//  Created by Ari Jain on 10/27/20.
//

import Foundation
import UIKit

class ForumTableView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var tableView = UITableView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    func sharedInit() {
        addSubview(tableView)
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = hexStringToUIColor(hex: "#222222")
        tableView.register(ForumCell.self, forCellReuseIdentifier: ForumCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForumCell.identifier, for: indexPath)
        cell.layer.borderWidth = 0.5
        cell.isUserInteractionEnabled = false
        cell.layer.borderColor = hexStringToUIColor(hex: "#d1d1e0").cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
