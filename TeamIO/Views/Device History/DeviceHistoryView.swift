//
//  DeviceHistoryView.swift
//  TeamIO
//
//  Created by Ari Jain on 10/26/20.
//

import Foundation
import UIKit

class DeviceHistoryView: UIView {
    
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
        addSubview(deviceName)
        addSubview(batteryPercentage)
        addSubview(descriptionLabel)
        addSubview(deviceHistory)
        addSubview(tableView)
        
        setupAllConstraints()
    }
    
    func setupAllConstraints() {
        setupDeviceNameConstraints()
        setupBatteryPercentageConstraints()
        setupDescriptionLabelConstraints()
        setupDeviceHistoryConstraints()
        setupTableViewConstraints()
    }
    
    //MARK: Creating all the views
    let tableView = DeviceHistoryTableView()
    
    let deviceName: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 32)
//        label.font = UIFont(name: "SF Pro", size: 50)
        label.text = "iPhone Charging Block"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let batteryPercentage: UIImageView = {
        let image = UIImage(named: "battery")
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "of your total energy usage went to this device this month"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    let deviceHistory: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Device History:"
        label.textColor = hexStringToUIColor(hex: "#D9C1FF")
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    //MARK: Setting up constraints
    func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: deviceHistory.bottomAnchor, constant: 5),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupDeviceHistoryConstraints() {
        deviceHistory.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deviceHistory.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            deviceHistory.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            deviceHistory.heightAnchor.constraint(equalToConstant: 30),
            deviceHistory.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: batteryPercentage.bottomAnchor, constant: 35),
            descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setupDeviceNameConstraints() {
        deviceName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deviceName.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            deviceName.leftAnchor.constraint(equalTo: self.leftAnchor),
            deviceName.widthAnchor.constraint(equalTo: self.widthAnchor),
            deviceName.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupBatteryPercentageConstraints() {
        batteryPercentage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            batteryPercentage.topAnchor.constraint(equalTo: deviceName.bottomAnchor, constant: 15),
            batteryPercentage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            batteryPercentage.heightAnchor.constraint(equalToConstant: 150),
            batteryPercentage.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
