//
//  ForumCell.swift
//  TeamIO
//
//  Created by Ari Jain on 10/27/20.
//

import Foundation
import UIKit

class ForumCell: UITableViewCell {
    
    static var identifier: String = "ForumCellOdentifier"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableViewCell() {
        backgroundColor = hexStringToUIColor(hex: "#222222")
        addAllSubviews()
        setupAllConstraints()
    }
    
    func addAllSubviews() {
        addSubview(forumLabel)
        addSubview(arrow)
    }
    
    func setupAllConstraints() {
        setupForumLabelConstraints()
        setupArrowConstraints()
    }
    
    let forumLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Saving Money"
        label.textColor = hexStringToUIColor(hex: "#D9C1FF")
        label.textAlignment = .center
        return label
    }()
    
    let arrow: UIImageView = {
        let image = UIImage(named: "rightarrow")
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setupArrowConstraints() {
        arrow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrow.rightAnchor.constraint(equalTo: self.rightAnchor, constant:  -10),
            arrow.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrow.heightAnchor.constraint(equalToConstant: 35),
            arrow.widthAnchor.constraint(equalToConstant: 35)
            
        ])
    }
    
    func setupForumLabelConstraints() {
        forumLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forumLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            forumLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            forumLabel.widthAnchor.constraint(equalToConstant: 150),
            forumLabel.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }

}
