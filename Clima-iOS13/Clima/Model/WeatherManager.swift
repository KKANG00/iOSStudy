//
//  WheatherManager.swift
//  Clima
//
//  Created by KKANG on 2021/07/01.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let apiconfig = Apiconfig()
    
    var weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)&appid=\(apiconfig.apikey)"
        perfromRequest(urlString: urlString)
    }
    
    func perfromRequest(urlString: String) {
        if let url = URL(string: urlString) {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    
                    return
                }
                
                if let safeData = data {
//                    parseJSON(weatherData: safeData)
                }
            }
            
            // start (선언시에 suspending 상태임)
            task.resume()
        }
    }
    
//    func parseJSON(weatherData: Data) -> <#return type#> {
//        <#function body#>
//    }
    
}