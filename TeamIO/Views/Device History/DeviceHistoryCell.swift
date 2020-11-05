//
//  DeviceHistoryCell.swift
//  TeamIO
//
//  Created by Ari Jain on 10/26/20.
//

import Foundation
import UIKit

class DeviceHistoryCell: UITableViewCell {
    
    static var identifier: String = "DeviceHistoryCell"

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
        addSubview(dateLabel)
        addSubview(timeLabel)
    }
    
    func setupAllConstraints() {
        setupDateLabelConstraints()
        setupTimeLabelConstraints()
    }
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "9/13"
        label.textColor = hexStringToUIColor(hex: "#59BFC7")
        label.textAlignment = .center
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "9:09 am - 11:02 pm"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    func setupTimeLabelConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            timeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30),
            timeLabel.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    
    func setupDateLabelConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            dateLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
}
