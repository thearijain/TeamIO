//
//  HomeScreenView.swift
//  TeamIO
//
//  Created by Ari Jain on 10/12/20.
//

import Foundation
import UIKit
import Charts

class HomeScreenView: UIView {
    
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
        addSubview(plugImage)
        addSubview(welcomelLabel)
        addSubview(graph)
        addSubview(weeklyUsageLabel)
        addSubview(moneySavedLabel)
        addSubview(yourDevicesLabel)
        addSubview(tableView)
        
        setupAllConstraints()
    }
    
    //MARK: Creating all the views
    let tableView = DevicesTableView()
    
    let plugImage: UIImageView = {
        let image = UIImage(named: "plug")
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let welcomelLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "Hello, Ari!"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let graph: LineChartView = {
        let imageView = LineChartView()
        imageView.noDataText = "Loading Data..."
        imageView.noDataTextColor = .white
        imageView.rightAxis.enabled = false
        imageView.leftAxis.labelTextColor = .white
        imageView.leftAxis.labelFont = .systemFont(ofSize: 14)
        imageView.xAxis.labelFont = .systemFont(ofSize: 14)
        imageView.xAxis.labelPosition = .bottom
        imageView.xAxis.labelTextColor = .white
        imageView.setScaleEnabled(true)
        imageView.animate(xAxisDuration: 2.5)

        return imageView
    }()
    
    let weeklyUsageLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Your Weekly Usage:"
        label.textColor = hexStringToUIColor(hex: "#D9C1FF")
        label.textAlignment = .center
        return label
    }()
    
    let moneySavedLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "You saved $23.89 dollars from last week!"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let yourDevicesLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Your Devices:"
        label.textColor = hexStringToUIColor(hex: "#D9C1FF")
        label.textAlignment = .center
        return label
    }()
    
    //MARK: Setting up constraints
    func setupAllConstraints() {
        setupPlugImageConstraints()
        setupWelcomeLabelConstraints()
        setupGraphImageContraints()
        setupWeeklyUsageLabelConstraints()
        setupMoneySavedLabel()
        setupTableViewcConstraints()
    }
    
    func setupTableViewcConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: moneySavedLabel.bottomAnchor, constant: 50),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupMoneySavedLabel() {
        moneySavedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moneySavedLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            moneySavedLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            moneySavedLabel.heightAnchor.constraint(equalToConstant: 25),
            moneySavedLabel.topAnchor.constraint(equalTo: graph.bottomAnchor, constant: 50)
        ])
    }
    
    func setupWeeklyUsageLabelConstraints() {
        weeklyUsageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weeklyUsageLabel.topAnchor.constraint(equalTo: welcomelLabel.bottomAnchor, constant: 30),
            weeklyUsageLabel.widthAnchor.constraint(equalToConstant: 200),
            weeklyUsageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            weeklyUsageLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupPlugImageConstraints() {
        plugImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plugImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            plugImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            plugImage.widthAnchor.constraint(equalToConstant: 100),
            plugImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupWelcomeLabelConstraints() {
        welcomelLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            welcomelLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            welcomelLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            welcomelLabel.widthAnchor.constraint(equalToConstant: 200),
            welcomelLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupGraphImageContraints() {
        graph.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            graph.topAnchor.constraint(equalTo: weeklyUsageLabel.bottomAnchor, constant: 50),
            graph.widthAnchor.constraint(equalTo: self.widthAnchor),
            graph.heightAnchor.constraint(equalToConstant: 200),
            graph.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5)
        ])
    }
}
