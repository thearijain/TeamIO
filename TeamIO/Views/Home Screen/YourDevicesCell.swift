//m
import Foundation
import UIKit

class YourDevicesCell: UITableViewCell {
    
    static var identifier: String = "YourDevicesCell"
    
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
        addSubview(deviceName)
        addSubview(seeEnergySavings)
    }
    
    func setupAllConstraints() {
        setupDeviceNameConstraints()
        setupSeeEnergySavingsConstraints()
    }
    
    let deviceName: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.text = "Phone charger"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let seeEnergySavings: UIImageView = {
        let image = UIImage(named: "energysaving")
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setupSeeEnergySavingsConstraints() {
        seeEnergySavings.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seeEnergySavings.heightAnchor.constraint(equalToConstant: 40),
            seeEnergySavings.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            seeEnergySavings.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            seeEnergySavings.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupDeviceNameConstraints() {
        deviceName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deviceName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            deviceName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            deviceName.heightAnchor.constraint(equalTo: self.heightAnchor),
            deviceName.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
