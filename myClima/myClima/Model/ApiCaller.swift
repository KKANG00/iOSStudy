//
//  ApiCaller.swift
//  Clima
//
//  Created by KKANG on 2021/07/09.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol ApiCallerDelegate {
    func didUpdateWeather(_ apicaller: ApiCaller, _ weather: WeatherModel)
}

class ApiCaller: ApiCallerDelegate {

    func didUpdateWeather(_ apicaller: ApiCaller, _ weather: WeatherModel) {
        print("didUpdateWeather")
    }
    
    let baseurl = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    var delegate: ApiCallerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(baseurl)&appid=\(Apiconfig.apikey)&q=\(cityName)"
//        print(urlString)
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String) {
        // url
        // session
        // task
        // task resume
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error)
                    return
                }
                
                if let safeData = data {
                    print(safeData)
                    if let weatherModel = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weatherModel)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            return WeatherModel(cityName: name, temperature: temp, weatherId: id)
        }
        catch {
            print(error)
            return nil
        }
    }
    
}
