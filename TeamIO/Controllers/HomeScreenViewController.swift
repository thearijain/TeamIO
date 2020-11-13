//
//  HomeScreenViewController.swift
//  TeamIO
//
//  Created by Ari Jain on 10/12/20.
//

import UIKit
import Charts

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
            
        test { (data) in
            let tuple = self.generateDataArrays(data: data)
            self.homeScreenView.graph.data = self.setData(tuple: tuple)
        }
        
    }
    
    func setData(tuple: ([ChartDataEntry], [Double], [Date])) -> LineChartData {
        let set = LineChartDataSet(entries: tuple.0)
        set.drawCirclesEnabled = false
        set.mode = .cubicBezier
        set.lineWidth = 2
        set.fill = Fill(color: .systemTeal)
        set.fillAlpha = 0.5
        set.drawFilledEnabled = true
        let data = LineChartData(dataSet: set)
        return data
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return .lightContent
    }
    
    @objc func customTransition() {
        let deviceHistoryController = DeviceHistoryController()
        navigationController?.pushViewController(deviceHistoryController, animated: true)
    }
    
    
    func generateDataArrays(data: [Device]) -> ([ChartDataEntry], [Double], [Date]) {
        var entries = [ChartDataEntry]()
        var powerArray = [Double]()
        var dateArray = [Date]()
        
        for piece in data {
            let power = Double(piece.POWER)
            let isoDate = piece.TIMESTAMP
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let date = dateFormatter.date(from:isoDate)!
            let numericDate = Double(date.timeIntervalSince1970)
            
            entries.append(ChartDataEntry(x: numericDate, y: power))
            powerArray.append(power)
            dateArray.append(date)
        }
        
        return (entries, powerArray, dateArray)
    }
    
    func test(completionHandler: @escaping ([Device]) -> Void) {
        let url = "https://hemswebapp.azurewebsites.net/item?appliance=7&user=0"

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in

            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Device].self, from: data)
                completionHandler(result)
                
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
        })
        task.resume()
    }

}

struct Device : Codable {
    
    let POWER: Int
    let TIMESTAMP: String

    init(POWER: Int, TIMESTAMP: String) {
        self.POWER = POWER
        self.TIMESTAMP = TIMESTAMP
    }
}
