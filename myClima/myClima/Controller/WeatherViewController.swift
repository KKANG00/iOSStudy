//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

//    @IBOutlet weak var conditionImageView: UIImageView!
//    @IBOutlet weak var temperatureLabel: UILabel!
//    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var TableView: UITableView!
    
    let apicaller = ApiCaller()
    var weathers: [WeatherModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        TableView.backgroundColor = UIColor.clear
        TableView.dataSource = self
        TableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        apicaller.delegate = self
    }


    @IBAction func searchButtonPressed(_ sender: Any) {
        let search = searchTextField.text!
        apicaller.fetchWeather(cityName: search)
        searchTextField.text = ""
    }
}

extension WeatherViewController: ApiCallerDelegate {
    func didUpdateWeather(_ apicaller: ApiCaller, _ weather: WeatherModel) {
        weathers.append(weather)
        print(weather, weathers)
        DispatchQueue.main.async {
            self.TableView.reloadData()
        }
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! TableViewCell
        print(weathers[indexPath.row])
//        print(weathers[indexPath.row].temperatureString)
        cell.CityNameLabel.text = weathers[indexPath.row].cityName
        cell.TemperatureLabel.text = weathers[indexPath.row].temperatureString
        cell.weatherIconImageView.image = UIImage(systemName: weathers[indexPath.row].weatherName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
}
